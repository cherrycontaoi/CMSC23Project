import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class Friends extends StatelessWidget {
  Friends({super.key});

  int _selectedIndex = 2;
  final ScrollController _pageController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 80.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text('Menu'),
              ),
            ),
            ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                }),
            ListTile(
                title: const Text('Todo Page'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/');
                }),
            ListTile(
                title: const Text('Friends'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/friends');
                }),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                context.read<AuthProvider>().signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: Column(children: [Text("\nThis is the Friends page")]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
              break;
            case 1:
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
              break;
            case 2:
              //only scroll to top when current index is selected
              if (_selectedIndex == index) {
                _pageController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
          }
        },
      ),
    );
  }
}
