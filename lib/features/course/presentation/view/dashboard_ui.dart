import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veda_learn/features/course/presentation/view_model/course_view_model.dart';
import 'package:veda_learn/features/course/presentation/view/course_tile.dart';

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseViewModel>(context, listen: false).fetchCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            /// TOP GREETING HEADER
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hi John',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'What language would\nyou like to learn?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: Image.asset(
                      "assets/images/dash_girl.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            /// MAIN CONTAINER
            Expanded(
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Languages being Learned",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// COURSE CARD SECTION (Dynamic)
                    SizedBox(
                      height: 200,
                      child: Consumer<CourseViewModel>(
                        builder: (context, viewModel, _) {
                          if (viewModel.isLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (viewModel.error != null) {
                            return Center(child: Text("Error: ${viewModel.error}"));
                          }

                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.courses.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final course = viewModel.courses[index];
                              return SizedBox(
                                width: 160,
                                child: CourseTile(
                                  course: course,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/lessons',
                                      arguments: course,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Optional: Add Progress List or Achievements
                    // ... existing ListTile progress indicators, if needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events),
            label: "Achievement",
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
