import 'package:flutter/material.dart';

class RegisterWelcomePage extends StatelessWidget {
  const RegisterWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 520,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 200),
                bottomRight: Radius.elliptical(60, 60),
              ),
            ),
            child: Image.asset("assets/images/welcome.png"),
          ),

          const SizedBox(height: 38),

          RichText(
            text: TextSpan(
              text: 'Create your profile',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              children: [
                TextSpan(
                  text: '\nNow!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),

          const Center(
            child: Text(
              'Create your profile to save your learning\nprogress and keep learning for free!',
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 48),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
