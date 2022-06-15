import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';
import '../../first_screen/first_screen.dart';

class AccountScreen extends StatelessWidget{
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Account Screen',style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(height: 10.0,),
                  IconButton(
                      onPressed: () {
                        sharedPreferences.remove('token').then((value) {
                          sharedPreferences.remove('fakeId');
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}