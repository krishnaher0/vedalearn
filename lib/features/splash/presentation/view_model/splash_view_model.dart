import 'dart:async';
import 'package:flutter/material.dart';

class SplashViewModel {
  final BuildContext context;

  SplashViewModel(this.context);

  void initSplash() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
}