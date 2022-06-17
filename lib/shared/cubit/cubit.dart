import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  DioHelper dio = DioHelper();
  int currentIndex = 0;
  HomeModel? homeModel;

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
      if (kDebugMode) {
        print('**************************** Home Data Successfully come from Api ****************************');
        print(homeModel?.status);
        print('**************************** Home Data Successfully come from Api ****************************');
      }
    }).catchError((onError) {
      if (kDebugMode) {
        emit(HomeErrorState());
        print('***********************************************************************************************');
        print('Error From Home Api:  ${onError.toString()}');
        print('***********************************************************************************************');
      }
    });
  }
}
