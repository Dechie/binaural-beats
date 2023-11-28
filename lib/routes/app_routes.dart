import 'package:get/get.dart';

import '../screens/home.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => Home()),
  ];
}
