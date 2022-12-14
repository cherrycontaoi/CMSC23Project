import 'dart:convert';

class User {
  final String userId;
  String name;
  String username;
  DateTime birthDate;

  User({
    required this.userId,
    required this.name,
    required this.username,
    required this.birthDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      username: json['username'],
      birthDate: json['birthDate'],
    );
  }

  static List<User> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<User>((dynamic d) => User.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(User user) {
    return {
      'userId': user.userId,
      'name': user.name,
      'username': user.username,
      'birthDate': user.birthDate,
    };
  }
}
