import 'package:shared_preferences/shared_preferences.dart';

class SharedDatePreferences {
  SharedDatePreferences();

  Future<void> saveDateValue(
      String nameKey, String dateKey, String name, int formattedDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(nameKey, name);
    await prefs.setInt(dateKey, formattedDate);

  }

  Future<String?> getNameValue(String nameKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(nameKey);
  }

  Future<int?> getDateTimestampValue(String dateKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(dateKey);
  }
}
