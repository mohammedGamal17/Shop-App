import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/modules/signup/signup.dart';

import 'package:shop_app/shared/components/components.dart';

import '../../shared/styles/colors.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_state.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.shopLoginModel.status!) {
              snack(context, content: '${state.shopLoginModel.message}');
            } else {
              snack(
                context,
                content: '${state.shopLoginModel.message}',
                bgColor: Colors.red,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        textFormField(
                          controller: emailController,
                          validate: (value) {
                            if (value.isEmpty ||
                                value.length < 14 ||
                                value.length > 50) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                          labelText: 'Email',
                          prefix: Icons.email_outlined,
                          borderRadius: 20.0,
                          autoFocus: true,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        textFormField(
                            controller: passwordController,
                            validate: (value) {
                              if (value.isEmpty ||
                                  value.length < 8 ||
                                  value.length > 50) {
                                return 'Please Enter Valid Password';
                              }
                              return null;
                            },
                            labelText: 'Password',
                            prefix: Icons.lock_outline,
                            borderRadius: 20.0,
                            textInputType: TextInputType.visiblePassword,
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixOnTap: () {
                              cubit.changePasswordVisibility();
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                // return navigateToAndReplace(context, Login());
                              }
                            }),
                        const SizedBox(
                          height: 10.0,
                        ),
                        state is! LoginLoadingState
                            ? InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    // return navigateToAndReplace(context, Login());
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    height: 40.0,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: buttonColor,
                                      gradient: LinearGradient(
                                        begin: AlignmentDirectional.topStart,
                                        end: AlignmentDirectional.bottomEnd,
                                        colors: [
                                          HexColor('0077B6'),
                                          HexColor('023E8A'),
                                        ],
                                      ),
                                    ),
                                    child: Text('Login',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ),
                                ),
                              )
                            : Center(child: circularProgressIndicator()),
                        Row(
                          children: [
                            const Text("If You Don't have an Account "),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  return navigateTo(context, SignUp());
                                },
                                child: Text('Register Now!',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
