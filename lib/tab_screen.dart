import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    home: TabScreen(),
    debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
  ));
}

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SMK Negeri 4 - Mobile Apps'),
          backgroundColor: Color.fromARGB(255, 200, 219, 212), // Mengubah warna background AppBar menjadi pink
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home, color: Colors.black), text: 'Home'),
              Tab(icon: Icon(Icons.star, color: Colors.black), text: 'Features'),
              Tab(icon: Icon(Icons.person, color: Colors.black), text: 'Profile'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            FeaturesTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.school, 'label': 'School Info', 'color': Colors.pink[100]!},
    {'icon': Icons.book, 'label': 'Courses', 'color': Colors.teal[100]!},
    {'icon': Icons.event, 'label': 'Events', 'color': Colors.orange[100]!},
    {'icon': Icons.notifications, 'label': 'Announcements', 'color': Colors.blue[100]!},
    {'icon': Icons.assignment, 'label': 'Assignments', 'color': Colors.green[100]!},
    {'icon': Icons.chat, 'label': 'Chat', 'color': Colors.purple[100]!},
    {'icon': Icons.settings, 'label': 'Settings', 'color': Colors.red[100]!},
    {'icon': Icons.help, 'label': 'Help', 'color': Colors.yellow[100]!},
    {'icon': Icons.location_on, 'label': 'Campus Map', 'color': Colors.brown[100]!},
    {'icon': Icons.schedule, 'label': 'Timetable', 'color': Colors.cyan[100]!},
    {'icon': Icons.phone, 'label': 'Contact Us', 'color': Colors.indigo[100]!},
    {'icon': Icons.info_outline, 'label': 'About Us', 'color': Colors.grey[100]!},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with blur effect
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Image.network(
              'https://www.w3schools.com/w3images/fjords.jpg', // Background image
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content overlay
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of items per row
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return GestureDetector(
                onTap: () {
                  // Handle tap on the menu icon
                  print('${item['label']} tapped');
                },
                child: Card(
                  color: item['color'], // Set the background color
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 50.0, color: Colors.black),
                        const SizedBox(height: 8.0),
                        Text(
                          item['label'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FeaturesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with blur effect
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Image.network(
              'https://www.w3schools.com/w3images/fjords.jpg', // Background image
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content overlay
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Key Features',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FeatureCard(icon: Icons.analytics, label: 'Performance Tracking'),
              FeatureCard(icon: Icons.grade, label: 'Grading System'),
              FeatureCard(icon: Icons.group, label: 'Community Engagement'),
              FeatureCard(icon: Icons.library_books, label: 'Digital Library'),
            ],
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(label),
        onTap: () {
          // Handle tap on feature card
          print('$label tapped');
        },
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with blur effect
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Image.network(
              'https://www.w3schools.com/w3images/fjords.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Content overlay
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://www.w3schools.com/w3images/avatar4.png'), // Gambar avatar wanita generik
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),
              const Text(
                'Irviana Ratu Alika',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Student ID: 123456',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 252, 252)),
              ),
              const Text(
                '@ratualika_',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 247, 247)),
              ),
              const SizedBox(height: 20),
              ProfileDetailCard(title: 'Email', value: 'ratuuu02@gmail.com'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  print('Edit Profile Pressed');
                },
                child: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileDetailCard extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
