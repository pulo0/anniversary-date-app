import 'dart:async';
import 'package:anniversary_date_app/tools/shared_date_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/logic/date_state.dart';

class DateCubit extends Cubit<DateState> {
  final SharedDatePreferences sharedDatePreferences;

  DateCubit(this.sharedDatePreferences)
      : super(InitialDateState(currentTime: DateTime.now()));

  Future<void> initializeData() async {
    emit(LoadingPrefDateState());
    final retrievedDate = await sharedDatePreferences.getDateTimestampValue();
    final eventDate = DateTime.fromMillisecondsSinceEpoch(retrievedDate);
    final name = await sharedDatePreferences.getNameValue();
    print('In cubit: $retrievedDate');
    emit(AddedPrefDateState(namePreference: '$retrievedDate', datePreference: eventDate, currentTime: DateTime.now()));
    // print('Event date in cubit: $eventDate');
    // final namePreference = await _nameHelper.initializeEventName();
    // emit(
    //   AddedPrefDateState(
    //     namePreference: namePreference,
    //     datePreference: eventDate,
    //     currentTime: DateTime.now(),
    //   ),
    // );

  }
}