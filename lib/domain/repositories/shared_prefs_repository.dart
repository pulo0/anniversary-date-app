abstract class SharedPrefsRepository {
  Future<void> saveNameValue(String name);

  Future<void> saveDateValue(int date);

  Future<String> getNameValue();

  Future<int> getDateTimestampValue();
}
