import 'package:shop_app/modules/Login/login_cubit/login_state.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginFailState extends LoginStates {
  final String error;

  LoginFailState(this.error);
}

class IsPassword extends LoginStates{}
