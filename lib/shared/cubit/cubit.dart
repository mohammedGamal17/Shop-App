import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/models/categories_model/categories.dart';
import 'package:shop_app/models/change_fav_model/change_fav_model.dart';
import 'package:shop_app/models/get_fav_model/get_fav_model.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/endpoint/end_point.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../models/home_model/home_model.dart';
import '../../modules/home_screens/account/account_screen.dart';
import '../../modules/home_screens/category/category_screen.dart';
import '../../modules/home_screens/favourite/favourite_screen.dart';
import '../../modules/home_screens/help/help_screen.dart';
import '../../modules/home_screens/home/home_screen.dart';
import '../components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInit());

  static AppCubit get(context) => BlocProvider.of(context);

  ///classes data model
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  ChangeFavModel? changeFavModel;
  GetFavModel? getFavModel;

  DioHelper dio = DioHelper();
  int currentIndex = 0;
  bool isFav = false;
  IconData icon = Icons.favorite_border_outlined;
  Map<int, bool> fav = {};

  //bool isSearchExpanded = false;
  //IconData searchIcon = Icons.search_outlined;

  List<Widget> screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
    const HelpScreen(),
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
      const HelpScreen();
    }
    emit(BtmNavBarChangeItemState());
  }

  void getHomeData() {
    emit(HomeLoadingState());
    dio
        .getDateFromApi(
      url: home,
      token: token,
    )
        .then((value) {
      emit(HomeSuccessState());
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products?.forEach((element) {
        fav.addAll({
          element.id!: element.inFavorites!,
        });
      });
      if (kDebugMode) {
        print(
            '**************************** Home Data Successfully come from Api ****************************');
        print(homeModel?.status);
        print(fav.toString());

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
        .getDateFromApi(
      url: getCategories,
      token: token,
    )
        .then((value) {
      emit(CategoriesSuccessState());
      categoriesModel = CategoriesModel.fromJson(value.data);
      if (kDebugMode) {
        print(
            '**************************** Categories Data Successfully come from Api ****************************');
        print(categoriesModel?.status);
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

  void postFavData(int productId) {
    fav[productId] = !fav[productId]!;
    emit(IconFavoriteChangeState());
    dio
        .postDateFromApi(
      url: favorites,
      data: {'product_id': productId},
      token: token,
    )
        .then((value) {
      changeFavModel = ChangeFavModel.fromJson(value.data);
      if (!changeFavModel!.status!) {
        fav[productId] = !fav[productId]!;
      }
      emit(FavSuccessState(changeFavModel!));
    }).catchError((onError) {
      fav[productId] = !fav[productId]!;
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
    dio
        .getDateFromApi(
      url: favorites,
      token: token,
    )
        .then((value) {
      getFavModel = GetFavModel.fromJson(value.data);
      emit(GetFavSuccessState());
      if (kDebugMode) {
        print(
            '**************************** Fav Data Successfully come from Api ****************************');
        print(getFavModel?.status);
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
}
