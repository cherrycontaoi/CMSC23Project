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
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

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

    final firstName = TextFormField(
      controller: firstNameController,
      decoration: const InputDecoration(
        hintText: "First Name",
      ),
    );

    final lastName = TextFormField(
      controller: lastNameController,
      decoration: const InputDecoration(
        hintText: "Last Name",
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
              firstNameController.text,
              lastNameController.text);
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
            firstName,
            lastName,
            SignupButton,
            backButton
          ],
        ),
      ),
    );
  }
}
