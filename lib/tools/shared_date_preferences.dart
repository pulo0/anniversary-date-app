import 'package:anniversary_date_app/tools/shared_date_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedDatePreferences {
  SharedDatePreferences();

  Future<void> saveDateValue(String name, int formattedDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedDatePreferencesKeys.name, name);
    await prefs.setInt(SharedDatePreferencesKeys.date, formattedDate);
    await prefs.reload();
  }
  //
  // Future<String> getNameValue() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(SharedDatePreferencesKeys.name) ?? '';
  // }
  //
  Future<int> getDateTimestampValue() async {
    final prefs = await SharedPreferences.getInstance();
    print('Gotten data: ${prefs.getInt(SharedDatePreferencesKeys.date) ?? 0}');
    return prefs.getInt(SharedDatePreferencesKeys.date) ?? 0;
  }
}
