import 'package:flutter/material.dart';
import 'package:veda_learn/view/login_screen.dart';
import 'package:veda_learn/view/splash_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}