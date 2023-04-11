import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:softic_ecommerce/apps/auth/model/auth_model.dart';

import '../constants/constants.dart';

class BaseClient {
  static Future<BaseOptions> getBaseOptions() async {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      validateStatus: (status) {
        return status! < 500;
      },

      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer $token',
      },
    );
    return options;
  }

  static Future<dynamic> get({required String url, var payload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.get(url, queryParameters: payload);
    debugPrint('\nURL: $url');
    debugPrint('Request Body: $response\n');
    return response;
  }

  static Future<dynamic> post({url, payload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.post(url, data: payload);
    debugPrint('\nURL: $url');
    debugPrint('Request Body: $response\n');
    return response;
  }

  static Future<dynamic> postWithQP({url, queryPayload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.post(url, queryParameters: queryPayload);
    return response;
  }

  static Future<dynamic> put({url, payload}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.put(url, data: payload);
    return response;
  }

  static Future<dynamic> delete({url}) async {
    var dio = Dio(await getBaseOptions());
    var response = await dio.delete(url);
    return response;
  }
}
