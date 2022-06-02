import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/home.dart';
import 'package:shop_app/modules/first_screen/first_screen.dart';
import 'package:shop_app/shared/cubit/bloc_observer.dart';
import 'package:shop_app/shared/styles/theme_service.dart';

import 'modules/page_view/page_view_screen.dart';

late SharedPreferences sharedPreferences;
bool? onBoarding = sharedPreferences.getBool('onBoarding');
String? token = sharedPreferences.getString('token');
Widget ?func(){
  if(onBoarding!=null){
    if(token!=null){
      return const Home();
    }else{
      return FirstScreen();
    }
  }else{
    return const PageViewScreen();
  }
}
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
      /*initialRoute: onBoarding == null || token == null
          ? "PageViewScreen"
          : "FirstScreen",
      routes: {
        "PageViewScreen": (BuildContext context) => const PageViewScreen(),
        "Home": (BuildContext context) => const Home(),
        "isGuest": (BuildContext context) => const Home(),
        "FirstScreen": (BuildContext context) => FirstScreen(),
      },*/
      home:func(),
    );
  }
}