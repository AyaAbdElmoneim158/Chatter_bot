import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset(
          'assets/lottie/splash_1.json',
          height: 150,
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
      nextScreen: const MainScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.grey[850]!,
    );
  }
}
