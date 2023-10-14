import 'package:demo_app/src/setup/di.dart';
import 'package:dio/dio.dart';

Dio dio = getIt<Dio>();

void configureDio() {
  // Set default configs
  dio.options.baseUrl = 'https://api.pub.dev';
  dio.options.connectTimeout = Duration(seconds: 5);
  dio.options.receiveTimeout = Duration(seconds: 3);
}
