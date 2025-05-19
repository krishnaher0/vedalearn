import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width * 1,
        child: Image.asset("assets/images/dashboard1.png", fit: BoxFit.fill),
      ),
    );
  }
}
