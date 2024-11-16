import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

class NameHelper {
  final sharedPrefsDate = SharedDatePreferences();

  String namePreference = '';

  Future<String> initializeEventName() async {
    String storedName = await sharedPrefsDate.getNameValue('name');
    namePreference = storedName;
    return namePreference;
  }

  String getNamePreference() {
    return namePreference;
  }
}
