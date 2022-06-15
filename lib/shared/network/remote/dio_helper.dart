import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../components/constants.dart';

late Dio dio;

class DioHelper {
  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  Future getDateFromApi({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'lang': lang,
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      };
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
    String lang = 'ar',
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'lang': lang,
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      };
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
