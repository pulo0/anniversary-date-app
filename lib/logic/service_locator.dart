import 'package:get_it/get_it.dart';
import 'package:anniversary_date_app/tools/name_helper.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';
import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<NameHelper>(() => NameHelper());

  locator.registerLazySingleton<TimeCalculations>(() => TimeCalculations());

  locator.registerLazySingleton<SharedDatePreferences>(
      () => SharedDatePreferences());
}
