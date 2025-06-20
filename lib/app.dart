import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/app/service_locator/service_locator.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_viewmodel.dart';
import 'package:veda_learn/theme/theme_data.dart';
import 'package:veda_learn/features/auth/presentation/view/age_screen.dart';
import 'package:veda_learn/features/auth/presentation/view/dashboard_screen.dart';
import 'package:veda_learn/features/auth/presentation/view/email_screen.dart';
import 'package:veda_learn/features/auth/presentation/view/login_screen.dart';
import 'package:veda_learn/features/auth/presentation/view/name_screen.dart';
import 'package:veda_learn/features/auth/presentation/view/password_screen.dart';
import 'package:veda_learn/features/auth/presentation/view/register_welcome_screen.dart';
import 'package:veda_learn/features/splash/presentation/view/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login':
            (context) => BlocProvider.value(
              value: serviceLocator<LoginViewModel>(),
              child: LoginScreen(),
            ),
        '/register': (context) => const RegisterWelcomeScreen(),
        '/age-screen':
            (context) => BlocProvider.value(
              value: serviceLocator<RegisterViewmodel>(),
              child: AgeScreen(),
            ),
        '/name-screen':
            (context) => BlocProvider.value(
              value: serviceLocator<RegisterViewmodel>(),
              child: NameScreen(),
            ),
        '/email-screen':
            (context) => BlocProvider.value(
              value: serviceLocator<RegisterViewmodel>(),
              child: EmailScreen(),
            ),
        '/password-screen':
            (context) => BlocProvider.value(
              value: serviceLocator<RegisterViewmodel>(),
              child: PasswordScreen(),
            ),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
