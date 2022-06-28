import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user/login_molel/shop_login_model.dart';
import '../../../models/user/register/register.dart';
import '../../network/endpoint/end_point.dart';
import '../../network/remote/dio_helper.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  DioHelper dio = DioHelper();
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  ShopLoginModel? loginModel;
  RegisterModel? registerModel;

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

  void postRegisterData({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SignUpLoadingState());
    dio.postDataToApi(
      url: register,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      if (kDebugMode) {
        print(
            '**************************** Register Successfully To Api ****************************');
        registerModel = RegisterModel.fromJson(value.data);
        print('Token : ${registerModel?.data?.token}');
        print(
            '**************************** Register Successfully To Api ****************************');
      }
      emit(SignUpSuccessState(registerModel!));
    }).catchError((onError) {
      emit(SignUpFailState(onError.toString()));
      if (kDebugMode) {
        print(
            '***********************************************************************************************');
        print('Error From Sign In Api:  ${onError.toString()}');
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
