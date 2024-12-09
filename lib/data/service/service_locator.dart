import 'package:get_it/get_it.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/utils/time_calculations.dart';
import 'package:anniversary_date_app/utils/shared_date_preferences.dart';

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
