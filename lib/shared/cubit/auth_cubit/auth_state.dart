import '../../../models/user/login_molel/shop_login_model.dart';
import '../../../models/user/register/register.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final ShopLoginModel shopLoginModel;

  LoginSuccessState(this.shopLoginModel);
}

class LoginFailState extends AuthStates {
  final String error;

  LoginFailState(this.error);
}
class SignUpLoadingState extends AuthStates {}

class SignUpSuccessState extends AuthStates {
  final RegisterModel registerModel;

  SignUpSuccessState(this.registerModel);
}

class SignUpFailState extends AuthStates {
  final String error;

  SignUpFailState(this.error);
}
class IsPasswordShowState extends AuthStates {}
