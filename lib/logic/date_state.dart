abstract class DateState {}

class InitialDateState extends DateState {
  final DateTime currentTime;

  InitialDateState({required this.currentTime});
}

class LoadingPrefDateState extends DateState {}

class AddedPrefDateState extends DateState {
  final String namePreference;
  final DateTime datePreference;
  final DateTime currentTime;

  AddedPrefDateState({
    required this.namePreference,
    required this.datePreference,
    required this.currentTime,
  });

  AddedPrefDateState copyWith({
    String? namePreference,
    DateTime? datePreference,
    DateTime? currentTime,
  }) {
    return AddedPrefDateState(
      namePreference: namePreference ?? this.namePreference,
      datePreference: datePreference ?? this.datePreference,
      currentTime: currentTime ?? this.currentTime,
    );
  }
}
