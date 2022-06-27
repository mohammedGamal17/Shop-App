import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/cubit/states.dart';
import '../../../../shared/styles/colors.dart';
import '../../../Login/login.dart';
import '../../../signup/signup_cubit/signup_state.dart';
import '../account_screen.dart';

class UpdateAccountScreen extends StatelessWidget {
  UpdateAccountScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final image = TextEditingController();

  final isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'SIGN UP',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 30.0),
                        textFormField(
                          controller: name,
                          validate: (value) {
                            if (value.isEmpty ||
                                value.length < 4 ||
                                value.length > 50) {
                              return 'Please Enter Yor Name';
                            }
                            return null;
                          },
                          labelText: 'Name',
                          prefix: Icons.account_circle_outlined,
                          borderRadius: 15.0,
                          autoFocus: true,
                          textInputType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        textFormField(
                          controller: email,
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
                          borderRadius: 15.0,
                          autoFocus: true,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        textFormField(
                          controller: phone,
                          validate: (value) {
                            if (value.isEmpty ||
                                value.length < 11 ||
                                value.length > 50) {
                              return 'Please Enter Valid Phone';
                            }
                            return null;
                          },
                          labelText: 'Phone',
                          prefix: Icons.phone,
                          borderRadius: 15.0,
                          autoFocus: true,
                          textInputType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        textFormField(
                          controller: password,
                          validate: (value) {
                            if (value.isEmpty ||
                                value.length < 8 ||
                                value.length > 50) {
                              return 'Please Enter Valid Password';
                            }
                            return null;
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              cubit.updateUserData(
                                name: name.text,
                                email: email.text,
                                password: password.text,
                                phone: phone.text,
                                image: image.text
                              );
                              snack(context, content: 'Sign Up Success');
                              return navigateToAndReplace(context, Login());
                            }
                          },
                          suffixOnTap: () {
                            cubit.changePasswordVisibility();
                          },
                          isPassword: cubit.isPassword,
                          suffix: cubit.suffix,
                          labelText: 'Password',
                          prefix: Icons.lock_outline,
                          borderRadius: 15.0,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        state is! SignUpLoadingState
                            ? InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.updateUserData(
                                        name: name.text,
                                        email: email.text,
                                        password: password.text,
                                        phone: phone.text,
                                        image: image.text
                                    );
                                    snack(context, content: 'Sign Up Success');
                                    return navigateTo(
                                        context, AccountScreen());
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    height: 40.0,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
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
                                    child: Text(
                                      'Sign Up',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                              )
                            : Center(child: circularProgressIndicator()),
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
