abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpFailState extends SignUpStates {
  final String error;

  SignUpFailState(this.error);
}
