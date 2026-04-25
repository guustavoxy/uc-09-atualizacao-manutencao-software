import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Dio dio;

  ApiService() : dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:5000/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
