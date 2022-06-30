import 'package:shop_app/models/user/logout/logout.dart';
import 'package:shop_app/models/user/update/update_user_model.dart';

import '../../../models/cart/add_cart/add_cart_model.dart';
import '../../../models/cart/get_cart/get_cart_model.dart';
import '../../../models/favorites/change_fav_model/change_fav_model.dart';

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

class IconFavoriteChangeState extends AppStates {}

class IconCartChangeState extends AppStates {}

class GetFavLoadingState extends AppStates {}

class GetFavSuccessState extends AppStates {}

class GetFavErrorState extends AppStates {}

class GetProfileLoadingState extends AppStates {}

class GetProfileSuccessState extends AppStates {}

class GetProfileErrorState extends AppStates {}

class LogoutSuccessState extends AppStates {
  final Logout logoutModel;

  LogoutSuccessState(this.logoutModel);
}

class LogoutFailState extends AppStates {}

class UpdateLoadingState extends AppStates {}

class UpdateSuccessState extends AppStates {
  final UpdateUserModel updateUserModel;

  UpdateSuccessState(this.updateUserModel);
}

class UpdateFailState extends AppStates {}

class SearchLoadingState extends AppStates {}

class SearchSuccessState extends AppStates {}

class SearchFailState extends AppStates {}

class AddCartLoadingState extends AppStates {}

class AddCartSuccessState extends AppStates {
  final AddCartModel addCartModel;

  AddCartSuccessState(this.addCartModel);
}

class AddCartFailState extends AppStates {
  final AddCartModel addCartModel;

  AddCartFailState(this.addCartModel);
}

class GetCartLoadingState extends AppStates {}

class GetCartSuccessState extends AppStates {
  final GetCartModel getCartModel;

  GetCartSuccessState(this.getCartModel);
}

class GetCartFailState extends AppStates {
  final GetCartModel getCartModel;

  GetCartFailState(this.getCartModel);
}

class IsPasswordShowState extends AppStates {}
