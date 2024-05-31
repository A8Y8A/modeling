import 'package:faker/faker.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      about: json['about'],
      image: json['image'],
    );
  }

  String getFullName() {
    return '$firstName $lastName'.trim();
  }
}
