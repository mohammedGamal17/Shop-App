import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../components/constants.dart';

late Dio dio;

class DioHelper {
  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  Future getDateFromApi({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      return await dio.get(
        url,
        queryParameters: query,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        return [];
      }
    }
  }

  Future postDateFromApi({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio.post(
        url,
        data: data,
        queryParameters: query,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}