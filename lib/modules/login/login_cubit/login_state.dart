import '../../../models/user/login_molel/shop_login_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final ShopLoginModel shopLoginModel;

  LoginSuccessState(this.shopLoginModel);
}

class LoginFailState extends LoginStates {
  final String error;

  LoginFailState(this.error);
}

class IsPasswordShowState extends LoginStates {}
