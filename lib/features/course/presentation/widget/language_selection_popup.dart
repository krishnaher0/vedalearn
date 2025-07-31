import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:veda_learn/app/constant/api/api_endpoint.dart';
import 'package:veda_learn/app/service_locator/service_locator.dart'; // Make sure this path is correct

import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_state.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_view_model.dart';

class LanguageSelectionPopup extends StatelessWidget {
  final Function(CourseEntity) onLanguageSelected;

  const LanguageSelectionPopup({super.key, required this.onLanguageSelected});

  @override
  Widget build(BuildContext context) {
    // Using MultiBlocProvider to allow for multiple BlocProviders
    return MultiBlocProvider(
      providers: [
        // Existing BlocProvider for CourseViewModel
        BlocProvider<CourseViewModel>(
          create: (_) => serviceLocator<CourseViewModel>()..fetchCourses(),
        ),
        // No need to add DashboardViewModel here as it's provided higher up
        // BlocProvider(create: (_) => serviceLocator<DashboardViewModel>()),
      ],
      child: BlocBuilder<CourseViewModel, CourseState>(
        builder: (context, state) {
          if (state.allCoursesStatus == CourseStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.allCoursesStatus == CourseStatus.failure) {
            return Center(
              child: Text("Failed to load languages: ${state.error ?? ''}"),
            );
          } else if (state.allCourses.isEmpty) {
            return const Center(child: Text("No languages available"));
          }

          final languages = state.allCourses;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Select a Language',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: languages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final course = languages[index];
                      final flagUrl =
                          '${ApiEndpoints.serverAddress}/${course.flagPath}';

                      return GestureDetector(
                        onTap: () => onLanguageSelected(course),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  flagUrl,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (_, __, ___) =>
                                          const Icon(Icons.language, size: 40),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                course.language,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}