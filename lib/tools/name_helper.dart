import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

class NameHelper {
  final sharedPrefsDate = SharedDatePreferences();

  String namePreference = '';

  Future<void> initializeEventName() async {
    String storedName = await sharedPrefsDate.getNameValue('name');
    namePreference = storedName;
  }

  String getNamePreference() {
    return namePreference;
  }
}
