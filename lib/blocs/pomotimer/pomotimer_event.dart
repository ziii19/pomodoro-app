part of 'pomotimer_bloc.dart';

class PomotimerEvent extends Equatable {
  const PomotimerEvent();

  @override
  List<Object?> get props => [];
}

class StartTimer extends PomotimerEvent {
  final int time;

  const StartTimer({required this.time});
}

class PausedTimer extends PomotimerEvent {}

class ChangeMode extends PomotimerEvent {}

class ResetTimer extends PomotimerEvent {}

class UpdateTime extends PomotimerEvent {
  final int? focusTime;
  final int? shortBreakTime;
  final int? longBreakTime;

  const UpdateTime({this.focusTime, this.shortBreakTime, this.longBreakTime});
  @override
  List<Object?> get props => [focusTime, shortBreakTime, longBreakTime];
}
