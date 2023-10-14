import 'package:demo_app/src/provider/auth/auth_local_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<AuthLocalProvider>(() => AuthLocalProvider());
}
