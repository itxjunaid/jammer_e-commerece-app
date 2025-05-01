import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    // Base URL configuration
    _dio.options.baseUrl = 'https://ecomerceapis.runasp.net/api/Users';
    _dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    // Add interceptors (optional)
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add authorization token to headers if available
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('accessToken');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioError error, handler) async {
        // Handle errors globally (optional)
        print('Dio Error: ${error.message}');
        return handler.next(error);
      },
    ));
  }

  // Getter to access the Dio instance
  Dio get dio => _dio;
}
