import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/login.png")),
            SizedBox(height: 20),
            Text(
              "Input your email",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "krishna61@gmail.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 50),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Input your password", style: TextStyle(color: Colors.blue)),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "********",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              

              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                onPressed: () {},
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                iconAlignment: IconAlignment.end,
                onPressed: () {},
                label: Text("Login with Google"),

                icon: Image.asset("assets/logo/google.png"),
              ),
            ),
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.blue,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
