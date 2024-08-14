import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import '../../utils/constants/image_constants.dart';
import '../chat/chat_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset(
          ImageConstant.splash1,
          height: 150,
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
      nextScreen: ChatView(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.grey[850]!,
    );
  }
}
