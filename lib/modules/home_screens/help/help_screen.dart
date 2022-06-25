import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_app/modules/Login/login.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import '../../../layout/home_layout.dart';
import '../../../main.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/cubit/states.dart';
import '../../first_screen/first_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            if (state.logoutModel.status!) {
              sharedPreferences.remove('token');
              token = '';
              snack(context, content: '${state.logoutModel.message}');
              navigateToAndReplace(context, const Home());
            } else {
              snack(
                context,
                content: '${state.logoutModel.message}',
                bgColor: Colors.red,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text('Help Screen',
                      style: Theme.of(context).textTheme.bodyText1),
                  sharedPreferences.getString('token') != null
                      ? Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  sharedPreferences
                                      .remove('fakeId')
                                      .then((value) async {
                                    sharedPreferences.remove('token');
                                    AppCubit.get(context)
                                        .logoutFromApi(token!)
                                        .then((value) {})
                                        .catchError((onError) {});
                                    navigateToAndReplace(
                                      context,
                                      const FirstScreen(),
                                    );
                                  }).catchError((onError) {
                                    if (kDebugMode) {
                                      print(onError.toString());
                                    }
                                  });
                                },
                                icon: const Icon(Icons.logout_outlined)),
                            Text(
                              'logout'.capitalize!,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        )
                      : Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                navigateToAndReplace(
                                  context,
                                  Login(),
                                );
                              },
                              icon: const Icon(Icons.login_outlined),
                            ),
                            Text(
                              'login'.capitalize!,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
