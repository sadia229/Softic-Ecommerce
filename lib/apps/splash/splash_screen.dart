import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:softic_ecommerce/apps/auth/model/auth_model.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getToken();
    super.initState();
  }

  getToken() async {
    final tokenBox = await Hive.openBox<Token>('tokenBox');
    final token = tokenBox.get('token');
    if (token != null) {
      Get.offNamed('/main');
    } else {
      Get.offNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Icon(CupertinoIcons.cart_fill, color: Colors.black,size: 50)),
        ],
      ),
    );
  }
}
