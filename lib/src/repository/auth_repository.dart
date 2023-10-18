import 'package:demo_app/src/provider/auth/auth_api_provider.dart';
import 'package:demo_app/src/provider/auth/auth_local_provider.dart';
import 'package:demo_app/src/setup/di.dart';

class AuthRepository {
  AuthLocalProvider _authLocalProvider = getIt<AuthLocalProvider>();
  AuthApiProvider _authApiProvider = getIt<AuthApiProvider>();
}
