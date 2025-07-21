import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Icon(Icons.menu),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset("assets/sanskrit_couple.png", height: 150),
              const SizedBox(height: 16),
              const Text("Learn Sanskrit", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const SizedBox(height: 24),
              const _LessonCard(level: 1, title: "Introduction", duration: "1 Hour 30 Minute", progress: 9, total: 50, color: Colors.green),
              const _LessonCard(level: 2, title: "Grammar", duration: "1 Hour 45 Minute", progress: 5, total: 40, color: Colors.orange),
              const _LessonCard(level: 3, title: "Vocabulary", duration: "1 Hour 2 Minute", progress: 2, total: 50, color: Colors.red),

              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: StadiumBorder()),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: Text("Learn Now", style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  final int level;
  final String title;
  final String duration;
  final int progress;
  final int total;
  final Color color;

  const _LessonCard({
    required this.level,
    required this.title,
    required this.duration,
    required this.progress,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text("LEVEL\n$level", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10)),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(duration),
            LinearProgressIndicator(value: progress / total, color: color, backgroundColor: Colors.grey[300]),
          ],
        ),
      ),
    );
  }
}
