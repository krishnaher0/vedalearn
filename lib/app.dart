import 'package:flutter/material.dart';
import 'package:veda_learn/view/age_screen.dart';
import 'package:veda_learn/view/dashboard_screen.dart';
import 'package:veda_learn/view/email_screen.dart';
import 'package:veda_learn/view/login_screen.dart';
import 'package:veda_learn/view/name_screen.dart';
import 'package:veda_learn/view/password_screen.dart';
import 'package:veda_learn/view/register_welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterWelcomeScreen(),
        '/agePage': (context) => const AgeScreen(),
        '/namePage': (context) => const NameScreen(),
        '/emailPage': (context) => const EmailScreen(),
        '/password': (context) => PasswordScreen(),
        '/dashboard': (context) => DashboardScreen()
      },
    );
  }
}
