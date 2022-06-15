import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/home_layout.dart';
import 'package:shop_app/modules/first_screen/first_screen.dart';
import 'package:shop_app/shared/cubit/bloc_observer.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/styles/theme_service.dart';

import 'modules/page_view/page_view_screen.dart';

late SharedPreferences sharedPreferences;
bool? onBoarding = sharedPreferences.getBool('onBoarding');
String? token = sharedPreferences.getString('token');
int? fakeId = sharedPreferences.getInt('fakeId');
Widget? widget;

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      sharedPreferences = await SharedPreferences.getInstance();
      await GetStorage.init();
      if (onBoarding != null) {
        if (token != null || fakeId != null) {
          widget = const Home();
        } else {
          widget = const FirstScreen();
        }
      } else {
        widget = const PageViewScreen();
      }
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            theme: ThemeService().light,
            darkTheme: ThemeService().dark,
            themeMode: ThemeService().getThemeMode(),
            debugShowCheckedModeBanner: false,
            home: widget,
          );
        },
      ),
    );
  }
}
