import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/cubit/app_cubit/cubit.dart';

import '../../../../main.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/cubit/app_cubit/states.dart';
import '../../../../shared/styles/colors.dart';
import '../account_screen.dart';

class UpdateAccountScreen extends StatelessWidget {
  UpdateAccountScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  final isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getProfileData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is UpdateSuccessState) {
            if (state.updateUserModel.status) {
              sharedPreferences
                  .setString('token', state.updateUserModel.data!.token)
                  .then((value) {
                token = state.updateUserModel.data?.token;
                navigateTo(context, const AccountScreen());
              }).catchError((onError) {
                if (kDebugMode) {
                  print(onError.toString());
                }
              });
              snack(context, content: state.updateUserModel.message);
            } else {
              snack(
                context,
                content: state.updateUserModel.message,
                bgColor: Colors.red,
              );
            }
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: state is! UpdateLoadingState
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                'Update Account',
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
                                hintText: cubit.getProfile?.data?.name,
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
                                hintText: cubit.getProfile?.data?.email,
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
                                hintText: cubit.getProfile?.data?.phone,
                                prefix: Icons.phone,
                                borderRadius: 15.0,
                                autoFocus: true,
                                textInputType: TextInputType.phone,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              state is! UpdateLoadingState
                                  ? InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.updateUserData(
                                            name: name.text,
                                            email: email.text,
                                            phone: phone.text,
                                          );
                                          navigateTo(
                                              context, const AccountScreen());
                                        }
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 40.0,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: buttonColor,
                                            gradient: LinearGradient(
                                              begin:
                                                  AlignmentDirectional.topStart,
                                              end: AlignmentDirectional
                                                  .bottomEnd,
                                              colors: [
                                                HexColor('0077B6'),
                                                HexColor('023E8A'),
                                              ],
                                            ),
                                          ),
                                          child: Text(
                                            'Up Date',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(child: circularProgressIndicator()),
                            ],
                          ),
                        ),
                      ),
                    )
                  : circularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
