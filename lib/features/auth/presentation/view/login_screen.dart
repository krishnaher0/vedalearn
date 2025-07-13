import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginViewModel>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 50),
          child: BlocListener<LoginViewModel, LoginState>(
            listenWhen: (previous, current) {
              return previous.formStatus != current.formStatus;
            },
            listener: (context, state) {
              if (state.formStatus == FormStatus.failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message ?? 'Login Failed..')),
                );
              } else if (state.formStatus == FormStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message ?? 'Login Successful..'),
                  ),
                );
                Navigator.pushNamed(context, '/dashboard');
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("assets/logo/vedlogo.png")),
                const SizedBox(height: 20),
                const Text(
                  "Input your email",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => bloc.add(LoginEmailChanged(value)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email address";
                    } else if (!emailRegex.hasMatch(value.trim())) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "krishna61@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Input your password",
                  style: TextStyle(color: Colors.blue),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) => bloc.add(LoginPasswordChanged(value)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 4) {
                      return "Password must be at least 4 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "********",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<LoginViewModel, LoginState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.add(
                              LoginSubmitted(state.email, state.password),
                            );
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    key: const ValueKey('google_login_btn'),
                    onPressed: () {},
                    icon: Image.asset("assets/logo/google.png", height: 24),
                    label: const Text("Login with Google"),
                  ),
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      key: const Key('register_button'),
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: const Text(
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
        ),
      ),
    );
  }
}
