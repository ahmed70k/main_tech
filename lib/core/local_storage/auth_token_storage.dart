import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AuthTokenStorage {
  static const _tokenKey = 'auth_token';

  final SharedPreferences _prefs;

  AuthTokenStorage(this._prefs);

  String? getToken() => _prefs.getString(_tokenKey);

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
  }
}
