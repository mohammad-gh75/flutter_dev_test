import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDio {
  AppDio._();

  static Dio instance() {
    final dio = Dio(
      BaseOptions(
        contentType: "application/json",
        connectTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      maxWidth: 90,
      compact: true,
      logPrint: print,
    ));
    return dio;
  }
}
