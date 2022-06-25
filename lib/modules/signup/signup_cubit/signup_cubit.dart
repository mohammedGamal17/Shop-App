import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/signup/signup_cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
}
