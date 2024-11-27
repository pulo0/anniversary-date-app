import 'package:shared_preferences/shared_preferences.dart';
import 'package:anniversary_date_app/tools/shared_date_preferences_keys.dart';

class SharedDatePreferences {
  SharedDatePreferences();

  Future<void> saveNameValue(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedDatePreferencesKeys.name, name);
  }

  Future<void> saveDateValue(int date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(SharedDatePreferencesKeys.date, date);
  }

  Future<String> getNameValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedDatePreferencesKeys.name) ?? '';
  }

  Future<int> getDateTimestampValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedDatePreferencesKeys.date) ?? 0;
  }
}
