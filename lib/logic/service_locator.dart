import 'package:get_it/get_it.dart';
import 'package:anniversary_date_app/logic/date_cubit.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';
import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<TimeCalculations>(() => TimeCalculations());

  locator.registerLazySingleton<SharedDatePreferences>(
      () => SharedDatePreferences());

  locator.registerLazySingleton<DateCubit>(
    () => DateCubit(
      locator<SharedDatePreferences>(),
      locator<TimeCalculations>(),
    ),
  );
}
