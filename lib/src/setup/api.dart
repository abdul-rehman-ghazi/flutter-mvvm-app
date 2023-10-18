import 'package:demo_app/src/provider/auth/auth_local_provider.dart';
import 'package:demo_app/src/setup/di.dart';
import 'package:dio/dio.dart';

Dio dio = getIt<Dio>();
AuthLocalProvider _authLocalProvider = getIt<AuthLocalProvider>();

void configureApi() {
  dio.options.baseUrl = 'https://dummyjson.com';
  dio.options.headers = {'Content-Type': 'application/json'};
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authLocalProvider.accessToken != null) {
          options.headers['Authorization'] =
              'Bearer ${_authLocalProvider.accessToken}';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // If a 401 response is received, refresh the access token
          // String newAccessToken = await refreshToken();

          // Update the request header with the new access token
          // e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          // Repeat the request with the updated header
          // return handler.resolve(await dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    ),
  );
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
}
