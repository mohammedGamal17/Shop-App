import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/models/categories_model/categories.dart';
import 'package:shop_app/models/user/update/update_user_model.dart';
import 'package:shop_app/shared/cubit/app_cubit/states.dart';

import 'package:shop_app/shared/network/endpoint/end_point.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../models/cart/add_cart/add_cart_model.dart';
import '../../../models/cart/get_cart/get_cart_model.dart';
import '../../../models/favorites/change_fav_model/change_fav_model.dart';
import '../../../models/favorites/get_fav_model/get_fav_model.dart';
import '../../../models/home_model/home_model.dart';
import '../../../models/search/search.dart';
import '../../../models/user/logout/logout.dart';
import '../../../models/user/profile/get_profile/get_profile.dart';
import '../../../modules/home_screens/account/account_screen.dart';
import '../../../modules/home_screens/category/category_screen.dart';
import '../../../modules/home_screens/favourite/favourite_screen.dart';
import '../../../modules/home_screens/help/help_screen.dart';
import '../../../modules/home_screens/home/home_screen.dart';
import '../../components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInit());

  static AppCubit get(context) => BlocProvider.of(context);

  ///classes data model
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  late ChangeFavModel changeFavModel;
  GetFavModel? getFavModel;
  GetProfile? getProfile;
  Logout? logoutModel;
  UpdateUserModel? updateUserModel;
  SearchModel? searchModel;
  late AddCartModel addCartModel;
  GetCartModel? getCartModel;

  DioHelper dio = DioHelper();
  int currentIndex = 0;
  bool isFav = false;
  IconData icon = Icons.favorite_border_outlined;
  IconData cartIcon = Icons.remove_shopping_cart_outlined;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  Map<int, bool> favMap = {};
  Map<dynamic, dynamic> cartMap = {};
  List<dynamic> search = [];

  List<Widget> screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
    HelpScreen(),
  ];
  List<String> title = [
    'Home',
    'Category',
    'Favourites',
    'Account',
    'Help',
  ];
  List<BottomNavigationBarItem> navBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_outlined),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.star),
      label: 'Favourites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Account',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.help_outline),
      label: 'Help',
    ),
  ];

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(IsPasswordShowState());
  }

  void navBarChange(int index) {
    currentIndex = index;
    if (index == 0) {
      const HomeScreen();
    }
    if (index == 1) {
      const CategoryScreen();
    }
    if (index == 2) {
      const FavouriteScreen();
    }
    if (index == 3) {
      const AccountScreen();
    }
    if (index == 4) {
      HelpScreen();
    }
    emit(BtmNavBarChangeItemState());
  }

  void getHomeData() {
    emit(HomeLoadingState());
    dio
        .getDataFromApi(
      url: home,
      token: TOKEN,
    )
        .then((value) {
      emit(HomeSuccessState());
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel!.data!.products!) {
        favMap.addAll({
          element.id: element.inFavorites,
        });
      }
      for (var element in getCartModel!.data!.cart_items!) {
        cartMap.addAll({
          element.product?.id: element.product?.inCart,
        });
      }
      if (kDebugMode) {
        print(
            '**************************** Home Data Successfully come from Api ****************************');
        print(homeModel?.status);
        print(favMap.toString());
        print(getProfile?.data?.token);

        print(
            '**************************** Home Data Successfully come from Api ****************************');
      }
    }).catchError((onError) {
      if (kDebugMode) {
        emit(HomeErrorState());
        print(
            '********************************** Error from Home API **********************************');
        print('Error From Home Api:  ${onError.toString()}');
        print(
            '********************************** Error from Home API **********************************');
      }
    });
  }

  void getCategoriesData() {
    dio
        .getDataFromApi(
      url: getCategories,
      token: TOKEN,
    )
        .then((value) {
      emit(CategoriesSuccessState());
      categoriesModel = CategoriesModel.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Categories Data Successfully come from Api ****************************');
        print(categoriesModel?.status);
        print(getProfile?.data?.token);
        print(
            '**************************** Categories Data Successfully come from Api ****************************');
      }
    }).catchError((onError) {
      if (kDebugMode) {
        emit(CategoriesErrorState());
        print(
            '********************************** Error from Categories API **********************************');
        print('Error From Categories Api:  ${onError.toString()}');
        print(
            '********************************** Error from Categories API **********************************');
      }
    });
  }

  postFavData(int productId) async {
    if (favMap[productId] == true) {
      favMap[productId] = false;
    } else {
      favMap[productId] = true;
    }
    emit(IconFavoriteChangeState());
    await dio
        .postDataToApi(
      url: favorites,
      data: {'product_id': productId},
      token: TOKEN,
    )
        .then((value) {
      changeFavModel = ChangeFavModel.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Fav Data Successfully come from Api ****************************');
        if (!changeFavModel.status!) {
          favMap[productId] = !favMap[productId]!;
        } else {
          getFavData();
        }
        print(getProfile?.data?.token);
        print(
            '**************************** Fav Data Successfully come from Api ****************************');
      }
      emit(FavSuccessState(changeFavModel));
    }).catchError((onError) {
      favMap[productId] = !favMap[productId]!;
      if (kDebugMode) {
        emit(FavErrorState());
        print(
            '********************************** Error from Fav API **********************************');
        print('Error From Fav Api:  ${onError.toString()}');
        print(
            '********************************** Error from Fav API **********************************');
      }
    });
  }

  void getFavData() {
    emit(GetFavLoadingState());
    getCart();
    dio
        .getDataFromApi(
      url: favorites,
      token: TOKEN,
    )
        .then((value) {
      getFavModel = GetFavModel.fromJson(value.data);
      emit(GetFavSuccessState());
      if (kDebugMode) {
        print(
            '**************************** Fav Data Successfully come from Api ****************************');
        print(getFavModel?.status);
        print(getProfile?.data?.token);
        print(
            '**************************** Fav Data Successfully come from Api ****************************');
      }
    }).catchError((onError) {
      if (kDebugMode) {
        emit(GetFavErrorState());
        print(
            '********************************** Error from FavGetFavData API **********************************');
        print('Error From GetFavData ${onError.toString()}');
        print(
            '********************************** Error from FavGetFavData API **********************************');
      }
    });
  }

  void getProfileData() {
    emit(GetProfileLoadingState());
    dio
        .getDataFromApi(
      url: profile,
      token: TOKEN,
    )
        .then((value) {
      emit(GetFavSuccessState());
      getProfile = GetProfile.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Profile Data Successfully come from Api ****************************');
        print(getProfile?.data?.name);
        print(getProfile?.data?.token);
        print(
            '**************************** Profile Data Successfully come from Api ****************************');
      }
      emit(GetFavSuccessState());
    }).catchError((onError) {
      emit(GetProfileErrorState());
      if (kDebugMode) {
        print(
            '********************************** Error from Profile API **********************************');
        print('Error From GetFavData ${onError.toString()}');
        print(
            '********************************** Error from Profile API **********************************');
      }
    });
  }

  logoutFromApi(String token) async {
    await dio
        .postDataToApi(
      url: logout,
      data: {'fcm_token': token},
      token: token,
    )
        .then((value) {
      logoutModel = Logout.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Logout Successfully come from Api ****************************');
        print(logoutModel?.message);
        print(getProfile?.data?.token);
        print(
            '**************************** Logout Successfully come from Api ****************************');
      }

      emit(LogoutSuccessState(logoutModel!));
    }).catchError((onError) {
      emit(LogoutFailState());
      if (kDebugMode) {
        print(
            '********************************** Error from FavGetFavData API **********************************');
        print('Error From GetFavData ${onError.toString()}');
        print(
            '********************************** Error from FavGetFavData API **********************************');
      }
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(UpdateLoadingState());
    dio
        .putDataToApi(
      url: updateProfile,
      data: {
        "name": name,
        "phone": phone,
        "email": email,
      },
      token: TOKEN,
    )
        .then((value) {
      updateUserModel = UpdateUserModel.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Update Acc Data Successfully To Api ****************************');
        print(updateUserModel?.data?.name);
        print(updateUserModel?.data?.token);
        print(
            '**************************** Update Acc Data Successfully To Api ****************************');
      }
      emit(UpdateSuccessState(updateUserModel!));
    }).catchError((onError) {
      emit(UpdateFailState());
      if (kDebugMode) {
        print(
            '********************************** Error from Update Acc Data To API **********************************');
        print('Error From Update Acc Data ${onError.toString()}');
        print(
            '********************************** Error from Update Acc Data To API **********************************');
      }
    });
  }

  void searchProduct(String product) {
    emit(SearchLoadingState());
    dio.postDataToApi(
      url: productsSearch,
      token: TOKEN,
      data: {
        "text": product,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Search Acc Data Successfully To Api ****************************');
        print(searchModel?.status);
        print(getProfile?.data?.token);
        print(
            '**************************** Search Acc Data Successfully To Api ****************************');
      }
      emit(SearchSuccessState());
    }).catchError((onError) {
      emit(SearchFailState());
      if (kDebugMode) {
        print(
            '********************************** Error from Search API **********************************');
        print('Error From Search ${onError.toString()}');
        print(
            '********************************** Error from Search API **********************************');
      }
    });
  }

  void addToCart(int productId) async {
    if (cartMap[productId] == true) {
      cartMap[productId] = false;
    } else {
      cartMap[productId] = true;
    }
    emit(IconCartChangeState());
    await dio
        .postDataToApi(
      url: carts,
      data: {'product_id': productId},
      token: TOKEN,
    )
        .then((value) {
      addCartModel = AddCartModel.fromJson(value.data);
      if (!addCartModel.status!) {
        cartMap[productId] = !cartMap[productId]!;
      } else {
        getCart();
      }
      print(
          '********************************** Add to Cart API Success **********************************');
      print(addCartModel.message.toString());
      print(getProfile?.data?.token);
      print(
          '********************************** Add to Cart API Success **********************************');
      emit(AddCartSuccessState(addCartModel));
    }).catchError((onError) {
      cartMap[productId] = !cartMap[productId]!;
      if (kDebugMode) {
        emit(AddCartFailState(addCartModel));
        print(
            '********************************** Error from add to cart API **********************************');
        print('Error From add to cart Api:  ${onError.toString()}');
        print(
            '********************************** Error from add to cart API **********************************');
      }
    });
  }

  void getCart() {
    emit(GetCartLoadingState());
    dio
        .getDataFromApi(
      url: carts,
      token: TOKEN,
    )
        .then((value) {
      getCartModel = GetCartModel.fromJson(value.data);

      print(
          '********************************** Get Cart API Success **********************************');
      print(getCartModel!.data!.cart_items?.length);
      print(cartMap.length);
      print(
          '********************************** Get Cart API Success **********************************');
      emit(GetCartSuccessState(getCartModel!));
    }).catchError((onError) {
      if (kDebugMode) {
        emit(GetCartFailState(getCartModel!));
        print(
            '********************************** Error from Get Cart API **********************************');
        print('Error From Get cart Api:  ${onError.toString()}');
        print(
            '********************************** Error from Get Cart API **********************************');
      }
    });
  }
}
