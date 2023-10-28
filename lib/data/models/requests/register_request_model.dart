// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequestModel {
  final String username;
  final String email;
  final String password;

  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
