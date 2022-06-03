import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/main.dart';
import 'package:shop_app/modules/first_screen/first_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../shared/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(actions: [
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
            ], title: Text(cubit.title[cubit.currentIndex])),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              items: cubit.navBarItem,
              onTap: (index) {
                cubit.navBarChange(index);
              },
            ),
          );
        },
      ),
    );
  }
}
