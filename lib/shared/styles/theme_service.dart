import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'colors.dart';

class ThemeService {
  final ThemeData light = ThemeData(
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: appBarLightColor,
      actionsIconTheme: IconThemeData(
        color: HexColor('03045E'),
        size: 20.0,
      ),
      titleTextStyle: TextStyle(
          color: HexColor('212529'),
          fontSize: 18.0,
          fontWeight: FontWeight.bold),
      titleSpacing: 10.0,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: HexColor('03045E'),
        size: 20.0,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: bottomNavigationBarLightColor,
      selectedIconTheme: IconThemeData(color: HexColor('212529'), size: 20.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('ADB5BD'),
      ),
      selectedItemColor: HexColor('212529'),
      selectedLabelStyle: const TextStyle(fontSize: 11.0),
    ),
    textTheme: TextTheme(
      headline5: TextStyle(
        color: HexColor('FFFFFF'),
        fontFamily: 'Changa',
      ),
      bodyText1: TextStyle(
        color: HexColor('FFFFFF'),
        fontFamily: 'Changa',
      ),
      caption: TextStyle(
        color: HexColor('FFFFFF'),
        fontFamily: 'Changa',
      ),
    ),
  );
  final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: AppBarTheme(
        backgroundColor: HexColor('212529'),
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20.0,
        ),
        titleTextStyle: TextStyle(
            color: HexColor('F8F9FA'),
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
        titleSpacing: 10.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('212529'),
      selectedIconTheme: IconThemeData(color: HexColor('f8f9fa'), size: 20.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('6c757d'),
      ),
      selectedItemColor: HexColor('f8f9fa'),
      selectedLabelStyle: const TextStyle(fontSize: 11.0),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: HexColor('dee2e6'),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: HexColor('F8F9FA'),
      ),
      bodyText1: TextStyle(
        color: HexColor('F8F9FA'),
      ),
      caption: TextStyle(
        color: HexColor('ADB5BD'),
      ),
    ),
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
