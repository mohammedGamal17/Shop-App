import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class DataStorage {
  final _getStorage = GetStorage();
  final _navigateKey = 'navigateAndSave';

  void saveNavigateData(bool isNavigate) {
    _getStorage.write(_navigateKey, isNavigate);
  }

  bool isNavigate() {
    return _getStorage.read(_navigateKey) ?? false;
  }

  ThemeMode getNavigate() {
    return isNavigate() ? ThemeMode.dark : ThemeMode.light;
  }
}
