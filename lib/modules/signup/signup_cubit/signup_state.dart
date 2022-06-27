import 'package:shop_app/models/user/register/register.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final RegisterModel registerModel;

  SignUpSuccessState(this.registerModel);
}

class SignUpFailState extends SignUpStates {
  final String error;

  SignUpFailState(this.error);
}
