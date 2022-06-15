import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/layout/home_layout.dart';
import 'package:shop_app/models/home_model/HomeModel.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/endpoint/end_point.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../main.dart';
import '../../modules/home_screens/account/account_screen.dart';
import '../../modules/home_screens/category/category_screen.dart';
import '../../modules/home_screens/favourite/favourite_screen.dart';
import '../../modules/home_screens/help/help_screen.dart';
import '../../modules/home_screens/home/home_screen.dart';
import '../components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInit());
  late DioHelper dio;

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

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

  late HomeModel homeModel;

  void getHomeData() {
    emit(HomeLoadingState());
    dio
        .getDateFromApi(
      url: home,
      token: token,
    )
        .then((value) {
      emit(HomeSuccessState());
      if (kDebugMode) {
        homeModel = HomeModel.fromJson(value.data);
        print(homeModel.data?.products![0].image);
        print(homeModel.toString());
      }
    }).catchError((onError) {
      if (kDebugMode) {
        emit(HomeErrorState());
        print(onError.toString());
      }
    });
  }
}
