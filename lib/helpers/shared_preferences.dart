import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static const String _userKey = 'user_data';

  /// Save user data as JSON string
  static Future<void> saveUser(String userJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userJson);
  }

  /// Retrieve user data as JSON string
  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  /// Clear user data
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
