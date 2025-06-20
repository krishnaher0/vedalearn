import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_state.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_viewmodel.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterViewmodel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 48),
        child: BlocListener<RegisterViewmodel, RegisterState>(
          listenWhen: (previous, current) {
            return previous.emailFormStatus != current.emailFormStatus &&
                (current.emailFormStatus == EmailFormStatus.failure ||
                    current.emailFormStatus == EmailFormStatus.success);
          },
          listener: (context, state) {
            if (state.emailFormStatus == EmailFormStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message ?? 'Registration Failed!'),
                ),
              );
              bloc.add(FormReset());
            } else if (state.emailFormStatus == EmailFormStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message ?? 'Registration Successful!'),
                ),
              );
              bloc.add(FormReset());
              Navigator.pushNamed(context, '/login');
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
              ),
              const SizedBox(height: 26),
              const Center(
                child: Text(
                  "Set up your password",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 34),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  onChanged:
                      (value) => bloc.add(RegisterPasswordChanged(value)),
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: true, // Keyboard shows up automatically
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 38),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: BlocBuilder<RegisterViewmodel, RegisterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        bloc.add(
                          OnFinalSubmission(
                            state.email,
                            state.name,
                            state.password,
                            state.age,
                          ),
                        );
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 82),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue, // Blue text
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
