import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/user/register/register.dart';
import 'package:shop_app/modules/signup/signup_cubit/signup_state.dart';
import 'package:shop_app/shared/network/endpoint/end_point.dart';

import '../../../shared/network/remote/dio_helper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
  DioHelper dio = DioHelper();
  RegisterModel? registerModel;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void postRegisterData({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SignUpLoadingState());
    dio.postDataFromApi(
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
