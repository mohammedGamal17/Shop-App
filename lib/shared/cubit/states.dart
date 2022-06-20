import 'package:shop_app/models/change_fav_model/change_fav_model.dart';

abstract class AppStates {}

class AppInit extends AppStates {}

class BtmNavBarChangeItemState extends AppStates {}

class HomeLoadingState extends AppStates {}

class HomeSuccessState extends AppStates {}

class HomeErrorState extends AppStates {}

class CategoriesSuccessState extends AppStates {}

class CategoriesErrorState extends AppStates {}

class FavSuccessState extends AppStates {
  final ChangeFavModel model;

  FavSuccessState(this.model);
}

class FavErrorState extends AppStates {}

class IconFavoriteChangeState extends AppStates{}

//class SearchChangeState extends AppStates{}