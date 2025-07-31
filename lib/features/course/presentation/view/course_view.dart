

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:veda_learn/app/constant/api/api_endpoint.dart';

// Import your Course feature components
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_state.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_view_model.dart';
import 'package:veda_learn/features/learning/presentation/view/learning_content_detail_view.dart';
import 'package:veda_learn/features/learning/presentation/view_model/learning_content_view_model.dart';


class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseViewModel>(
      create: (context) => GetIt.instance<CourseViewModel>()..fetchCourses(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
         
        
        ),
        body: BlocBuilder<CourseViewModel, CourseState>(
          builder: (context, state) {
            if (state.allCoursesStatus == CourseStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.allCoursesStatus == CourseStatus.failure) {
              return Center(child: Text('Error loading courses: ${state.error ?? "Unknown error"}'));
            } else if (state.allCoursesStatus == CourseStatus.success) {
              if (state.allCourses.isEmpty) {
                return const Center(child: Text('No courses available.'));
              }
              return _buildCoursesView(context, state.allCourses);
            }
            return const Center(child: Text('Initialize course loading...'));
          },
        ),
      ),
    );
  }

  Widget _buildCoursesView(BuildContext context, List<CourseEntity> courseEntities) {
    return Column(
      children: [
        // Header (your existing gradient header)
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF667EEA),
                Color(0xFF764BA2),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Language Courses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose a language to start learning',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Courses List
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: courseEntities.length,
              itemBuilder: (context, index) {
                return _buildCourseCard(context, courseEntities[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(BuildContext context, CourseEntity courseEntity) {
    final Color defaultCardColor = const Color(0xFF667EEA);

    final String imagePath = courseEntity.flagPath;
    final String fullImageUrl = '${ApiEndpoints.serverAddress}/$imagePath';

    final String courseName = courseEntity.language;
    final String courseLevel = 'Beginner';
    final int totalLessons = 0;
    final int completedLessons = 0;
    final double progress = totalLessons > 0 ? completedLessons / totalLessons : 0.0;


    return GestureDetector(
      onTap: () { // THIS IS THE ONTAP HANDLER
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider<LearningContentViewModel>(
              create: (context) => GetIt.instance<LearningContentViewModel>()
                ..fetchLearningContentByCourse(courseEntity.id!), // Trigger fetch for the tapped course's content
              child: LearningContentDetailView(
                courseId: courseEntity.id!,
                courseName: courseName,
                courseLanguage: courseEntity.language,
                courseThumbnail: Image.network(fullImageUrl).image, // Pass ImageProvider
                courseColor: defaultCardColor,
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Language Flag and Level
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    fullImageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 40, color: Colors.grey);
                    },
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: defaultCardColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      courseLevel,
                      style: TextStyle(
                        color: defaultCardColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Course Name
              Text(
                courseName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                courseEntity.description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const Spacer(),

              // Progress
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'lessons',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: defaultCardColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFFE2E8F0),
                    valueColor: AlwaysStoppedAnimation<Color>(defaultCardColor),
                    minHeight: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}