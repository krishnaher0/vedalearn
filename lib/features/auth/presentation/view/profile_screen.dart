import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"), centerTitle: true),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Learn"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Achievement"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back),
                const Text("My Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Icon(Icons.menu),
              ],
            ),
            const SizedBox(height: 20),

            // Avatar and Name
            Row(
              children: [
                const CircleAvatar(radius: 30, backgroundImage: AssetImage("assets/avatar.png")),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Sanam Saud", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Newbie", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.edit),
              ],
            ),

            const SizedBox(height: 24),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatItem(label: "Total Learn", value: "2+ hours"),
                _StatItem(label: "Achievements", value: "20"),
                _StatItem(label: "Language", value: "2"),
              ],
            ),

            const SizedBox(height: 24),

            // Dashboard Items
            _DashboardItem(title: "Settings", icon: Icons.settings),
            _DashboardItem(title: "Achievements", icon: Icons.emoji_events, badge: "2 New"),
            _DashboardItem(title: "Privacy", icon: Icons.lock, badge: "Action Needed", badgeColor: Colors.red),

            const Spacer(),

            // Account Actions
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Switch to Another Account", style: TextStyle(color: Colors.blue)),
                SizedBox(height: 8),
                Text("Logout Account", style: TextStyle(color: Colors.red)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? badge;
  final Color? badgeColor;

  const _DashboardItem({
    required this.title,
    required this.icon,
    this.badge,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: badgeColor ?? Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(badge!, style: const TextStyle(color: Colors.white)),
            )
          : const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
