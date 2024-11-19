import 'dart:async';
import 'package:anniversary_date_app/tools/shared_date_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/logic/date_state.dart';
import 'package:anniversary_date_app/tools/name_helper.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';

class DateCubit extends Cubit<DateState> {
  final SharedDatePreferences sharedDatePreferences;
  Timer? _timer;

  DateCubit(this.sharedDatePreferences)
      : super(InitialDateState(currentTime: DateTime.now()));

  Future<void> initializeData() async {
    final eventDate = await sharedDatePreferences.getDateTimestampValue();
    print('In cubit: $eventDate');
    // print('Event date in cubit: $eventDate');
    // final namePreference = await _nameHelper.initializeEventName();
    // emit(
    //   AddedPrefDateState(
    //     namePreference: namePreference,
    //     datePreference: eventDate,
    //     currentTime: DateTime.now(),
    //   ),
    // );

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (e) {
      if (state is AddedPrefDateState) {
        final currentState = state as AddedPrefDateState;
        emit(currentState.copyWith(currentTime: DateTime.now()));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
