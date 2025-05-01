import 'dart:convert';
import 'package:jammer/features/user/data/services/profile_api_model.dart';
import 'package:jammer/shared/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  final DioClient _dioClient = DioClient();

  Future<Map<String, dynamic>> signup(String fullName, String email,
      String password, String phoneNumber) async {
    try {
      final response = await _dioClient.dio.post(
        '/Signup',
        data: jsonEncode({
          'fullName': fullName,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
        }),
      );

      final data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'isSuccess': true,
          'message': data["message"] ?? "Signup Successful"
        };
      } else {
        return {
          'isSuccess': false,
          'message': data["message"] ?? "Signup Failed"
        };
      }
    } catch (e) {
      return {'isSuccess': false, 'message': "Error: $e"};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await _dioClient.dio.post(
        '/Login',
        data: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      final data = response.data;
      print("Login API Response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = data["data"]["token"];
        await prefs.setString('accessToken', token);

        return {
          'isSuccess': true,
          'message': data["message"] ?? "Login Successful",
        };
      } else {
        return {
          'isSuccess': false,
          'message': data["message"] ?? "Login Failed",
        };
      }
    } catch (e) {
      print("Error in login: $e");
      return {'isSuccess': false, 'message': "Error: $e"};
    }
  }

  Future<ApiResponse> uSERgET() async {
    try {
      final response = await _dioClient.dio.get('/UserProfile');

      final data = response.data;
      print("API Response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.fromJson(data);
      } else {
        throw Exception("Failed to fetch user data: ${data['message']}");
      }
    } catch (e) {
      print("Error in uSERgET: $e");
      throw Exception("Error: $e");
    }
  }
}
