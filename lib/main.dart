import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/home.dart';
import 'package:shop_app/shared/cubit/bloc_observer.dart';
import 'package:shop_app/shared/styles/theme_service.dart';

import 'modules/page_view/page_view_screen.dart';

late SharedPreferences sharedPreferences;

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      sharedPreferences = await SharedPreferences.getInstance();
      await GetStorage.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeService().light,
      darkTheme: ThemeService().dark,
      themeMode: ThemeService().getThemeMode(),
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPreferences.getString('token') == null
          ? "PageViewScreen"
          : "Home",
      routes: {
        "PageViewScreen": (BuildContext context) => const PageViewScreen(),
        "Home": (BuildContext context) => const Home(),
        "isGuest": (BuildContext context) => const Home(),
      },
      //home: const PageViewScreen(),
    );
  }
}
//sharedPreferences.getString('token') == null
//           ? "PageViewScreen"
//           : "Home",
