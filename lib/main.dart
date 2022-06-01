import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/shared/cubit/bloc_observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import 'package:shop_app/shared/styles/theme_service.dart';

import 'modules/page_view/page_view_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await GetStorage.init();
      await CacheHelper.init();
      bool navigateAndSave = CacheHelper.getData(key: 'navigateAndSave');
      if (kDebugMode) {
        print(navigateAndSave);
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
    return GetMaterialApp(
      theme: ThemeService().light,
      darkTheme: ThemeService().dark,
      themeMode: ThemeService().getThemeMode(),
      debugShowCheckedModeBanner: false,
      home: const PageViewScreen(),
    );
  }
}
