import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'colors.dart';

class ThemeService {
  final ThemeData light = ThemeData(
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackground,
      actionsIconTheme:IconThemeData(
        color: HexColor('FFFFFF'),
        size: 20.0,
      ),
      titleTextStyle: TextStyle(
          color: HexColor('FFFFFF'),
          fontSize: 18.0,
          fontWeight: FontWeight.bold),
      titleSpacing: 10.0,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: HexColor('FFFFFF'),
        size: 20.0,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: lightBackground,
      selectedIconTheme: IconThemeData(color: HexColor('FFFFFF'), size: 24.0),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        size: 16.0,
        color: HexColor('00B4D8'),
      ),
      selectedItemColor: HexColor('FFFFFF'),
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
      bodyText2: TextStyle(
        color: HexColor('00B4D8'),
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
        backgroundColor: darkBackground,
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20.0,
        ),
        titleTextStyle: TextStyle(
            color: HexColor('F8F9FA'),
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
        titleSpacing: 10.0,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: HexColor('F8F9FA'),
        size: 20.0,
      ),
    ),
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
      headline5: TextStyle(
        color: HexColor('FFFFFF'),
        fontFamily: 'Changa',
      ),
      bodyText1: TextStyle(
        color: HexColor('FFFFFF'),
        fontFamily: 'Changa',
      ),
      bodyText2: TextStyle(
        color: HexColor('00B4D8'),
        fontFamily: 'Changa',
      ),
      caption: TextStyle(
        color: HexColor('FFFFFF'),
        fontFamily: 'Changa',
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
