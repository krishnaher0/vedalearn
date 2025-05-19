import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3DB3FF),
      body: Center(
        child: Image.asset("assets/logo/logo.png", width: 200, height: 200),
      ),
    );
  }
}
