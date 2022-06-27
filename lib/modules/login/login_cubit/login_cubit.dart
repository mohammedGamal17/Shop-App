import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user/login_molel/shop_login_model.dart';
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
    dio.postDataToApi(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      if (kDebugMode) {
        print(
            '**************************** login Data Successfully come from Api ****************************');
        loginModel = ShopLoginModel.fromJson(value.data);
        print('Token : ${loginModel?.data?.token}');
        print(
            '**************************** login Data Successfully come from Api ****************************');
      }
      emit(LoginSuccessState(loginModel!));
    }).catchError((onError) {
      emit(LoginFailState(onError.toString()));
      if (kDebugMode) {
        print(
            '***********************************************************************************************');
        print('Error From login Api:  ${onError.toString()}');
        print(
            '***********************************************************************************************');
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
