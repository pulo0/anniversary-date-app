import 'package:shared_preferences/shared_preferences.dart';
import 'package:anniversary_date_app/utils/shared_date_preferences_keys.dart';
import 'package:anniversary_date_app/domain/repositories/shared_prefs_repository.dart';

class SharedPrefsRepositoryImpl implements SharedPrefsRepository {
  const SharedPrefsRepositoryImpl();

  @override
  Future<void> saveNameValue(String name) async {
    final prefs = await SharedPreferences.getInstance();
    if (name != '') {
      await prefs.setString(SharedDatePreferencesKeys.name, name);
    }
  }

  @override
  Future<void> saveDateValue(int date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(SharedDatePreferencesKeys.date, date);
  }

  @override
  Future<String> getNameValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedDatePreferencesKeys.name) ?? '';
  }

  @override
  Future<int> getDateTimestampValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedDatePreferencesKeys.date) ?? 0;
  }
}
