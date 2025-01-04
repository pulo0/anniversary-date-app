import 'package:get_it/get_it.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:anniversary_date_app/utils/validator_bottom_sheet.dart';
import 'package:anniversary_date_app/utils/time_calculations.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/domain/repositories/overlay_repository.dart';
import 'package:anniversary_date_app/domain/repositories/fcm_notification_repository.dart';
import 'package:anniversary_date_app/domain/repositories/shared_prefs_repository.dart';
import 'package:anniversary_date_app/domain/repositories/selector_repository.dart';
import 'package:anniversary_date_app/data/implementations/overlay_repository_impl.dart';
import 'package:anniversary_date_app/data/implementations/shared_prefs_repository_impl.dart';
import 'package:anniversary_date_app/data/implementations/selector_repository_impl.dart';
import 'package:anniversary_date_app/data/implementations/fcm_notification_repository_impl.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<FcmNotificationRepository>(
      () => FcmNotificationRepositoryImpl(FirebaseMessaging.instance));

  locator.registerLazySingleton<TimeCalculations>(() => TimeCalculations());

  locator.registerLazySingleton<ValidatorBottomSheet>(
      () => ValidatorBottomSheet());

  locator.registerLazySingleton<SharedPrefsRepository>(
      () => const SharedPrefsRepositoryImpl());

  locator.registerLazySingleton<DateCubit>(
    () => DateCubit(
      locator<SharedPrefsRepository>(),
      locator<TimeCalculations>(),
    ),
  );

  locator.registerLazySingleton<OverlayRepository>(
    () => const OverlayRepositoryImpl(),
  );

  locator.registerLazySingleton<SelectorRepository>(
    () => const SelectorRepositoryImpl(),
  );
}
