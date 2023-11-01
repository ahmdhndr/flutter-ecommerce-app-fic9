import 'package:dartz/dartz.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/variables.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/requests/login_request_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/requests/register_request_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
      headers: headers,
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return left('Invalid username/password');
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    if (data.identifier == '' || data.password == '') {
      return left('Email/password tidak boleh kosong');
    }

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local'),
      headers: headers,
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return left('Invalid username/password');
    } else {
      return left('Server Error');
    }
  }
}
