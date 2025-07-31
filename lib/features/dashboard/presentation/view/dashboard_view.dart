import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veda_learn/app/service_locator/service_locator.dart';
import 'package:veda_learn/features/achievement/presentation/view/achievement_view.dart';
import 'package:veda_learn/features/course/domain/entity/course_entity.dart';
import 'package:veda_learn/features/course/presentation/view/course_view.dart';
import 'package:veda_learn/features/course/presentation/widget/language_selection_popup.dart';
import 'package:veda_learn/features/dashboard/presentation/view_model/dashboard_event.dart';
import 'package:veda_learn/features/dashboard/presentation/view_model/dashboard_state.dart';
import 'package:veda_learn/features/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:veda_learn/features/home/presentation/view/home_view.dart';
import 'package:veda_learn/features/profile/presentation/view/profile_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardViewModel>(
      create: (context) => serviceLocator<DashboardViewModel>(),
      child: BlocBuilder<DashboardViewModel, DashboardState>(
        builder: (context, state) {
          int selectedIndex = 0;
          String currentLanguage = 'Select Language';
          CourseEntity? selectedCourse;

          if (state is DashboardInitial) {
            selectedIndex = state.selectedIndex;
            selectedCourse = state.selectedCourse;
            currentLanguage = selectedCourse?.language ?? 'Select Language';
          }

          final List<Widget> _screens = [
            HomeView(course: selectedCourse),
            const CourseView(),
            const AchievementView(),
            const ProfileView(),
          ];

          return Scaffold(
            backgroundColor: const Color(0xFFF8FAFC),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (bottomSheetContext) => Container(
                          height: MediaQuery.of(bottomSheetContext).size.height * 0.7,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          child: BlocProvider.value(
                            value: BlocProvider.of<DashboardViewModel>(context),
                            child: Builder(
                              builder: (innerContext) {
                                return LanguageSelectionPopup(
                                  onLanguageSelected: (course) {
                                    debugPrint('Selected: ${course.language}');
                                    innerContext.read<DashboardViewModel>().add(
                                      LanguageSelected(selectedCourse: course),
                                    );
                                    Navigator.pop(innerContext);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.language, color: Colors.white, size: 24),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'VedLingo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      Text(
                        currentLanguage,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications_outlined, color: Color(0xFF64748B)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            body: _screens[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                context.read<DashboardViewModel>().add(TabSelected(index));
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xFF667EEA),
              unselectedItemColor: const Color(0xFF94A3B8),
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school_outlined),
                  activeIcon: Icon(Icons.school),
                  label: 'Learn',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events_outlined),
                  activeIcon: Icon(Icons.emoji_events),
                  label: 'Achievement',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
