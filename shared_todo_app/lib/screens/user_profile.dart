import 'package:flutter/material.dart';

// may button
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero, //remove padding
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Todo Page'),
              onTap: () {
                Navigator.pop(
                    context); //para hindi bumalik sa hamburger button na drawer header
                Navigator.pushNamed(context, '/');
                // Update the state of the app.
                // ...copy paste here the navigator.push method here
                //you may navigate to SecondScreen
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Column(children: [
        Text(
            "\nName: Cherry Mae Contaoi\nBirthday: May 14, 2000\nLocation: Los Banos, Laguna\n\nBio: Hi! I like dogs and cats. Whenever I see a stray animal, I always end up staying ther efor a couple of minutes just to pet them. It's nice because most of them are friendly to humans.")
      ]),
    );
  }
}
