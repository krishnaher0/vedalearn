import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back),
              const SizedBox(height: 16),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 5,
                        decoration: BoxDecoration(
                          color: i < 4 ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 32),
              const Text("What’s the meaning of this sentence?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              Row(
                children: [
                  const Icon(Icons.volume_up, color: Colors.blue),
                  const SizedBox(width: 12),
                  const Text("“यत् भावे तत् भवति”", style: TextStyle(fontSize: 18)),
                ],
              ),

              const SizedBox(height: 16),
              const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '"As you think, so shall you become."',
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Done")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
