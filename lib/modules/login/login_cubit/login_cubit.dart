import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/endpoint/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  DioHelper dio = DioHelper();
  bool isShow = true;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    dio.postDateFromApi(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      emit(LoginSuccessState());
      if (kDebugMode) {
        print(value.data);
      }
    }).catchError((onError) {
      emit(LoginFailState(onError.toString()));
      if (kDebugMode) {
        print(onError.toString());
      }
    });
  }

  void showPassword(){
    isShow = !isShow;
    emit(IsPassword());
  }
}
