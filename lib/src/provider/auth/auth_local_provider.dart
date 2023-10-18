import 'dart:convert';

import 'package:demo_app/src/model/user.dart';
import 'package:demo_app/src/setup/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _keyAccessToken = '_keyAccessToken';
const String _keyUser = '_keyUser';

class AuthLocalProvider {
  final SharedPreferences _sharedPreferences = getIt<SharedPreferences>();

  bool isUserLoggedIn() => _sharedPreferences.containsKey(_keyAccessToken);

  Future<bool> loginUser(String accessToken, User user) async {
    final userJson = jsonEncode(user.toJson());
    return await _sharedPreferences.setString(_keyAccessToken, accessToken) &&
        await _sharedPreferences.setString(_keyUser, userJson);
  }

  Future<User?> getUser() async {
    final userJson = _sharedPreferences.getString(_keyUser);
    if (userJson != null) {
      final userMap = json.decode(userJson);
      return User.fromJson(userMap);
    }
    return null;
  }

  String? get accessToken => _sharedPreferences.getString(_keyAccessToken);

  Future<bool> logoutUser(String accessToken, User user) async {
    return await _sharedPreferences.remove(_keyAccessToken) &&
        await _sharedPreferences.remove(_keyUser);
  }
}
