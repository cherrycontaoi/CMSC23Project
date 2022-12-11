import 'dart:convert';

class User {
  final String id;
  String name;
  String username;

  User({
    required this.id,
    required this.name,
    required this.username,
  });

  factory User.fromJason(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
    );
  }

  static List<
}
