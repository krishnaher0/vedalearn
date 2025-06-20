// views/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:veda_learn/features/splash/presentation/view_model/splash_view_model.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the ViewModel and start the timer
    SplashViewModel(context).initSplash();

    return Scaffold(
      backgroundColor: const Color(0xFF3DB3FF),
      body: Center(
        child: Image.asset("assets/logo/logo.png"),
      ),
    );
  }
}
