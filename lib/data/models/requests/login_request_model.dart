// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequestModel {
  final String identifier;
  final String password;

  LoginRequestModel({required this.identifier, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifier': identifier,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
