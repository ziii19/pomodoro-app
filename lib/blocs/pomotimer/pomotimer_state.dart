part of 'pomotimer_bloc.dart';

enum Status { initial, running, paused, completed }

enum PomoMode { focus, shortBreak, longBreak }

class PomotimerState extends Equatable {
  const PomotimerState({
    this.status = Status.initial,
    this.mode = PomoMode.focus,
    this.focusTime = 10,
    this.shortBreakTime = 5,
    this.longBreakTime = 15,
  });

  final Status status;
  final PomoMode mode;
  final int focusTime;
  final int shortBreakTime;
  final int longBreakTime;

  factory PomotimerState.initial() {
    return const PomotimerState();
  }

  PomotimerState copywith({
    Status? status,
    PomoMode? mode,
    int? focusTime,
    int? shortBreakTime,
    int? longBreakTime,
  }) {
    return PomotimerState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      focusTime: focusTime ?? this.focusTime,
      shortBreakTime: shortBreakTime ?? this.shortBreakTime,
      longBreakTime: longBreakTime ?? this.longBreakTime,
    );
  }

  @override
  List<Object?> get props =>
      [status, mode, focusTime, shortBreakTime, longBreakTime];
}
