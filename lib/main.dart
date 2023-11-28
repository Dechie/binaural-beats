import 'package:binaural/home_controller.dart';
import 'package:binaural/routes/app_routes.dart';
import 'package:binaural/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.splash,
      getPages: Routes.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    );
  }
}
