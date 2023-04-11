import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:softic_ecommerce/general/api/base_client.dart';
import 'package:softic_ecommerce/general/constants/urls.dart';

class AuthRepository {
  // Login
  static login({payload,username,password}) async {
    try {
      var response =
          await BaseClient.post(url: Urls.loginUrl(username, password), payload: payload);
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }
}
