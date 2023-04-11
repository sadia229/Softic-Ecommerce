import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/auth_model.dart';
import '../repository/auth_repository.dart';

class AuthController {
  login(
    BuildContext context, {
    required String username,
    required String? password,
  }) async {
    final data = {"username": username, "password":password,"rememberMe": true};
    dio.Response response = await AuthRepository.login(payload: data,username: username,password: password);
    if (response.statusCode == 200) {
      final token = Token()..accessToken = response.data['id_token'];
      final tokenBox = await Hive.openBox<Token>('tokenBox');
      await tokenBox.put('token', token);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Successfully Login'),
        duration: Duration(seconds: 3),
      ));

      if (token != null) {
        Get.offNamed('/main');
      } else {
        Get.offNamed('/login');
      }

    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Login failed'),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
      debugPrint("status code error");
    }
  }
}
