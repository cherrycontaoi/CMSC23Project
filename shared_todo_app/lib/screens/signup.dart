import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/auth_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController displayNameController = TextEditingController();
    TextEditingController birthdayController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    final username = TextFormField(
      controller: usernameController,
      decoration: const InputDecoration(
        hintText: "Username",
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );

    final displayName = TextFormField(
      controller: displayNameController,
      decoration: const InputDecoration(
        hintText: "Name",
      ),
    );

    final birthday = TextFormField(
      controller: birthdayController,
      decoration: const InputDecoration(
        hintText: "Birthday (Month Day, Year)",
      ),
    );

    final location = TextFormField(
      controller: locationController,
      decoration: const InputDecoration(
        hintText: "Location",
      ),
    );

    final SignupButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          //call the auth provider here
          context.read<AuthProvider>().signUp(
                usernameController.text,
                passwordController.text,
                displayNameController.text,
                birthdayController.text,
                locationController.text,
              );
          Navigator.pop(context);
        },
        child: const Text('Sign up', style: TextStyle(color: Colors.white)),
      ),
    );

    final backButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: const Text('Back', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[
            Image.asset(
              'images/appLogo1.png',
              width: 600,
              fit: BoxFit.cover,
            ),
            const Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            username,
            password,
            displayName,
            birthday,
            location,
            SignupButton,
            backButton
          ],
        ),
      ),
    );
  }
}
