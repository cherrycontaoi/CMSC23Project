import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

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
    );
  }
}
