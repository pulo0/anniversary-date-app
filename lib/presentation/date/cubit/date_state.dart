abstract class DateState {}

class InitialDateState extends DateState {}

class AddedPrefDateState extends DateState {
  final String namePreference;
  final DateTime datePreference;

  AddedPrefDateState({
    required this.namePreference,
    required this.datePreference,
  });

  AddedPrefDateState copyWith({
    String? namePreference,
    DateTime? datePreference,
  }) {
    return AddedPrefDateState(
      namePreference: namePreference ?? this.namePreference,
      datePreference: datePreference ?? this.datePreference,
    );
  }
}
