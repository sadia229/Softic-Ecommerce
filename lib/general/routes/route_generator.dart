import 'package:softic_ecommerce/apps/auth/screen/login_screen.dart';
import 'package:softic_ecommerce/apps/home/screen/home_screen.dart';
import 'package:softic_ecommerce/apps/main_screen.dart';
import 'package:softic_ecommerce/apps/splash/splash_screen.dart';
import 'package:softic_ecommerce/general/routes/route_constants.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteConstants.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteConstants.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteConstants.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteConstants.main,
      page: () => const MainScreen(),
    ),
  ];
}
