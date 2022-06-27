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

  Future getDataFromApi({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
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

  Future postDataToApi({
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

  Future putDataToApi({
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
      return await dio.put(
        url,
        queryParameters: query,
        data: data,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        return [];
      }
    }
  }
}
