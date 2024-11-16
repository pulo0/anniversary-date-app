import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/logic/date_state.dart';
import 'package:anniversary_date_app/tools/name_helper.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';

class DateCubit extends Cubit<DateState> {
  final TimeCalculations _tCalc;
  final NameHelper _nameHelper;
  Timer? _timer;

  DateCubit(this._tCalc, this._nameHelper)
      : super(InitialDateState(currentTime: DateTime.now()));

  Future<void> initializeData() async {
    emit(InitialDateState(currentTime: DateTime.now()));
    final eventDate = await _tCalc.initializeEventDate();
    final namePreference = await _nameHelper.initializeEventName();
    emit(
      AddedPrefDateState(
        namePreference: namePreference,
        datePreference: eventDate,
        currentTime: DateTime.now(),
      ),
    );

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
