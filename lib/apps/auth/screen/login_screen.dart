import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softic_ecommerce/apps/auth/components/remember_password.dart';
import 'package:softic_ecommerce/apps/auth/controllers/auth_controllers.dart';
import 'package:softic_ecommerce/widget/appbar/k_appbar.dart';
import 'package:softic_ecommerce/widget/button/custom_btn.dart';
import 'package:softic_ecommerce/widget/textfield/password_field.dart';
import 'package:softic_ecommerce/widget/textfield/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  String? accessToken;
  final _rememberMe = ValueNotifier<bool>(false);
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: KAppBar(title: "Login"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            KTextField(
              controller: username,
              prefixIcon: CupertinoIcons.person_alt_circle,
              hintText: "Enter Username",
              passwordVisible: false,
            ),
            const SizedBox(height: 20),
            PasswordField(controller: password, hintText: "Enter Password"),
            const SizedBox(height: 20),
            const RememberPassword(),
            const SizedBox(height: 20),
            KButton(
              data: "Login",
              onPressed: () {
                authController.login(context,
                    username: username.text, password: password.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
