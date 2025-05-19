import 'package:flutter/material.dart';
import 'package:veda_learn/view/email_screen.dart';


class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 48),
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
                "What is your name?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 34),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmailScreen()),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 82),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmailScreen()),
                  );
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
    );
  }
}
