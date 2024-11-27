import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/logic/date_state.dart';
import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit(this.sharedDatePreferences) : super(InitialDateState());

  final SharedDatePreferences sharedDatePreferences;

  Future<void> initializeData() async {
    emit(InitialDateState());
    final prefName = await sharedDatePreferences.getNameValue();
    final retrievedDate = await sharedDatePreferences.getDateTimestampValue();
    emit(
      AddedPrefDateState(
        namePreference: prefName,
        datePreference: DateTime.fromMillisecondsSinceEpoch(retrievedDate),
      ),
    );
  }
}
