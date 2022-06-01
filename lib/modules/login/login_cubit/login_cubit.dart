import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_login_model.dart';
import '../../../shared/network/endpoint/end_point.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  DioHelper dio = DioHelper();
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  ShopLoginModel? loginModel;

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

      if (kDebugMode) {
        loginModel = ShopLoginModel.fromJson(value.data);
        //print(value.data);
      }
      emit(LoginSuccessState(loginModel!));
    }).catchError((onError) {
      emit(LoginFailState(onError.toString()));
      if (kDebugMode) {
        print(onError.toString());
      }
    });
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(IsPasswordShowState());
  }
}
