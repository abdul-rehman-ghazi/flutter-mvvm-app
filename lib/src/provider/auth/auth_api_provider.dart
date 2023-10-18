import 'package:demo_app/src/model/Response_log_in.dart';
import 'package:demo_app/src/model/base/base_api_response.dart';
import 'package:demo_app/src/setup/di.dart';
import 'package:dio/dio.dart';

class AuthApiProvider {
  Dio _dio = getIt<Dio>();

  Future<BaseApiResponse<ResponseLogIn>> logIn({
    required String userName,
    required String password,
  }) async {
    _dio.post('/auth/logIn',
        data: {'userName': userName, 'password': password});
  }
}
