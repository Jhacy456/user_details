import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MemberDetailsScreen(),
    );
  }
}

class MemberDetailsScreen extends StatelessWidget {
  const MemberDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Member Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.redAccent),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    "assets/images/flutterpi.jpg",
                  ), // Use local image
                ),

                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jacinta Akpene",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Young Adult",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4),
                    Text("Carecell: David Carecell"),
                    Text("Sunday: Youth English"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Departments
            Wrap(
              spacing: 8,
              children: [
                _buildTag("Youth"),
                _buildTag("Media"),
                _buildTag("Pathfinders"),
              ],
            ),

            SizedBox(height: 20),

            // Buttons (Moved Send Message to Footer)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildButton("Assign roles", Colors.green)],
            ),

            SizedBox(height: 20),

            // Sections
            _buildSection("Recent Appointments", "Not authorized to see"),
            _buildSection(
              "Recent Requests",
              "Requested for funds for books\nRequest to use church premise",
              actionText: "Go to requests",
              actionColor: Colors.blue,
            ),
            _buildSection("Library Information", "Not authorized to see"),

            SizedBox(height: 20),

            // Roles Assigned
            Text(
              "Roles Assigned",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildRoleCard("President - Youth Ministry"),
            _buildRoleCard("Member - Media"),
            _buildRoleCard("Executive - Pathfinders"),
            _buildRoleCard("Teacher - Sunday School"),
            _buildRoleCard("Teacher - Children's Service (11-13 class)"),
          ],
        ),
      ),

      // Footer Section
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {
              // Action for Send Message
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Send Message",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function for sections
  Widget _buildSection(
    String title,
    String content, {
    String? actionText,
    Color? actionColor,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(content, style: TextStyle(color: Colors.grey[700])),
            if (actionText != null)
              TextButton(
                onPressed: () {},
                child: Text(actionText, style: TextStyle(color: actionColor)),
              ),
          ],
        ),
      ),
    );
  }

  // Helper function for tags
  Widget _buildTag(String text) {
    return Chip(
      label: Text(text, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blueAccent,
    );
  }

  // Helper function for buttons (except Send Message)
  Widget _buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  // Helper function for role cards
  Widget _buildRoleCard(String role) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(Icons.assignment_ind, color: Colors.blueAccent),
        title: Text(role, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
