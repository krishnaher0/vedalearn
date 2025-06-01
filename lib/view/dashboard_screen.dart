import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 20),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "7 level",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(Icons.play_arrow),
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
                                        fontSize: 14,
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
                                        Icon(Icons.play_arrow),
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
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          
                          child: Image.asset("assets/images/nepali.png"),
                        ),
                        title: Text("Nepali"),
                        subtitle: LinearProgressIndicator(
                          value: 0.8,
                          minHeight: 6,
                          color: Colors.blue,
                        ),
                        
                        trailing: SizedBox(
                          height: 100,
                          child: Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 30, 0, 0), child: Text("60%"),),

                        ),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          
                          child: Image.asset("assets/images/nepali.png"),
                        ),
                        title: Text("Nepali"),
                        subtitle: LinearProgressIndicator(
                          value: 0.8,
                          minHeight: 6,
                          color: Colors.blue,
                        ),
                        
                        trailing: SizedBox(
                          height: 100,
                          child: Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 30, 0, 0), child: Text("60%"),),

                        ),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          
                          child: Image.asset("assets/images/nepali.png"),
                        ),
                        title: Text("Nepali"),
                        subtitle: LinearProgressIndicator(
                          value: 0.8,
                          minHeight: 6,
                          color: Colors.blue,
                        ),
                        
                        trailing: SizedBox(
                          height: 100,
                          child: Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 30, 0, 0), child: Text("60%"),),

                        ),
                      ),
                      Container(
                        height: 20,
                        width: double.infinity,
                        color: Colors.red,
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
            icon: Icon(Icons.message_outlined),
            label: "Chat",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: "Favourite",
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            label: "Profile",
          ),
 
                    ],
                  ),
                ),
              ),
          
          ),
            ]
        ),
      ),
    );
  }
}
