import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, top: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi John',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 8),

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
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 160,

                    child: Image.asset(
                      "assets/images/dash_girl.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 1 * size.height,
                    minWidth: size.width,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Languages being Learned",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 5,
                              color: Colors.green,
                              child: Padding(
                                padding: EdgeInsetsGeometry.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sanskrit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,

                                      children: [
                                        Text(
                                          "7 level",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        const SizedBox(width: 20),
                                        

                                        Icon(Icons.play_arrow, size: 60,color: Colors.blue,fill: 0,),
                                      ],
                                    ),
                                    Text(
                                      "5k active participation",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              
                              elevation: 5,
                              color: Colors.green,
                              child: Padding(
                                padding: EdgeInsetsGeometry.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nepali",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "5 level",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Icon(Icons.play_arrow, size: 60,color: Colors.blue,),
                                      ],
                                    ),
                                    Text(
                                      "5k active participation",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,

                              child: Image.asset(
                                "assets/images/nepali.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text("Nepali"),
                            subtitle: LinearProgressIndicator(
                              value: 0.8,
                              minHeight: 6,
                              color: Colors.blue,
                            ),

                            trailing: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(
                                  0,
                                  30,
                                  0,
                                  0,
                                ),
                                child: Text("80%"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,

                              child: Image.asset(
                                "assets/images/sanskrit.png",
                                fit: BoxFit.fill,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            title: Text("Sanskrit"),
                            subtitle: LinearProgressIndicator(
                              value: 0.3,
                              minHeight: 6,
                              color: Colors.blue,
                            ),

                            trailing: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(
                                  0,
                                  30,
                                  0,
                                  0,
                                ),
                                child: Text("30%"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              // backgroundColor: Colors.white,
                              radius: 30,

                              child: Image.asset(
                                "assets/images/newari.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text("Newari"),
                            subtitle: LinearProgressIndicator(
                              value: 0.1,
                              minHeight: 6,
                              color: Colors.blue,
                            ),

                            trailing: SizedBox(
                              height: 100,
                              child: Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(
                                  0,
                                  30,
                                  0,
                                  0,
                                ),
                                child: Text("10%"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
