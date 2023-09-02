import 'package:binaural/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/images/logo.png'),
        duration: 3000,
        backgroundColor: midnightBlack,
        curve: Curves.easeInOut,
        splashIconSize: 250,
        splashTransition: SplashTransition.slideTransition,
        animationDuration: const Duration(milliseconds: 1500),
        pageTransitionType: PageTransitionType.fade,
        nextScreen: Home(),
      ),
    );
  }
}
