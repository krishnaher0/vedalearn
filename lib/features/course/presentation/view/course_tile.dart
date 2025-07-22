import 'package:flutter/material.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

class CourseTile extends StatelessWidget {
  final CourseEntity course;
  final VoidCallback onTap;

  const CourseTile({
    Key? key,
    required this.course,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Image.network(
      "http://localhost:3001/${course.flagPath}",
      width: 40,
      height: 40,
      fit: BoxFit.contain,
    ),

              const SizedBox(height: 10),
              Text(
                course.language,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                course.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
