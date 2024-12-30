import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/utils/time_calculations.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_state.dart';
import 'package:anniversary_date_app/domain/repositories/shared_prefs_repository.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit(this.sharedPrefsRepository, this.tCalc) : super(InitialDateState());

  final SharedPrefsRepository sharedPrefsRepository;
  final TimeCalculations tCalc;

  Future<void> initializeData() async {
    emit(InitialDateState());
    final prefName = await sharedPrefsRepository.getNameValue();
    final retrievedDate = await sharedPrefsRepository.getDateTimestampValue();
    if (retrievedDate != 0) {
      tCalc.initCycleIndex(DateTime.fromMillisecondsSinceEpoch(retrievedDate));
      emit(
        AddedPrefDateState(
          namePreference: prefName,
          datePreference: DateTime.fromMillisecondsSinceEpoch(retrievedDate),
        ),
      );
    } else {
      emit(InitialDateState());
    }
  }
}
