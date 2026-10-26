import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const _keyName = 'user_name';
  static const _keyEmail = 'user_email';
  static const _keyPassword = 'user_password';
  static const _keyAge = 'user_age';
  static const _keyCondition = 'user_condition';
  static const _keyLoggedIn = 'is_logged_in';

  static Future<void> saveAccount({
    required String name,
    required String email,
    required String password,
    String age = '29 years',
    String condition = 'Hypertension monitoring',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
    await prefs.setString(_keyAge, age);
    await prefs.setString(_keyCondition, condition);
    await prefs.setBool(_keyLoggedIn, true);
  }

  static Future<void> updateAccount({
    String? name,
    String? email,
    String? password,
    String? age,
    String? condition,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getSavedAccount();

    await prefs.setString(_keyName, name ?? current['name'] ?? 'Jane Doe');
    await prefs.setString(_keyEmail, email ?? current['email'] ?? '');
    await prefs.setString(_keyPassword, password ?? current['password'] ?? '');
    await prefs.setString(_keyAge, age ?? current['age'] ?? '29 years');
    await prefs.setString(
      _keyCondition,
      condition ?? current['condition'] ?? 'Hypertension monitoring',
    );
  }

  static Future<Map<String, String>> getSavedAccount() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_keyName) ?? 'Jane Doe',
      'email': prefs.getString(_keyEmail) ?? '',
      'password': prefs.getString(_keyPassword) ?? '',
      'age': prefs.getString(_keyAge) ?? '29 years',
      'condition': prefs.getString(_keyCondition) ?? 'Hypertension monitoring',
    };
  }

  static Future<void> setLoggedIn({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  static Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, false);
  }
}
