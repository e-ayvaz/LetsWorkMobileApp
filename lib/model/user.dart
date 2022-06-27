import 'package:mongo_dart/mongo_dart.dart';

class User {
  late String id;
  late String name;
  late String email;
  late String password;
  late String confirmPassword;
  late String university;
  late String department;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.university,
      required this.department});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'university': university,
      'department': department,
    };
  }

  factory User.fromMap(Map<String, dynamic> map)
      {
        return User(
          id: map['_id'],
          name: map['name'],
          email: map['email'],
          password: map['password'],
          confirmPassword: map['confirmPassword'],
          university: map['university'],
          department: map['department'],
        );
      }
}
