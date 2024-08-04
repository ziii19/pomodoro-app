part of 'pomotimer_bloc.dart';

enum Status { initial, running, paused, completed }

enum PomoMode { focus, shortBreak, longBreak }

class PomotimerState extends Equatable {
  const PomotimerState({
    this.status = Status.initial,
    this.mode = PomoMode.focus,
    this.focusTime = 1500,
    this.shortBreakTime = 300,
    this.longBreakTime = 900,
    this.isAudioOn = false,
  });

  final Status status;
  final PomoMode mode;
  final int focusTime;
  final int shortBreakTime;
  final int longBreakTime;
  final bool isAudioOn;

  factory PomotimerState.initial() {
    return const PomotimerState();
  }

  PomotimerState copywith({
    Status? status,
    PomoMode? mode,
    int? focusTime,
    int? shortBreakTime,
    int? longBreakTime,
    bool? isAudioOn,
  }) {
    return PomotimerState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      focusTime: focusTime ?? this.focusTime,
      shortBreakTime: shortBreakTime ?? this.shortBreakTime,
      longBreakTime: longBreakTime ?? this.longBreakTime,
      isAudioOn: isAudioOn ?? this.isAudioOn,
    );
  }

  Color get darkBg {
    if (mode == PomoMode.focus) {
      return const Color(0XFF0D0404);
    } else if (mode == PomoMode.shortBreak) {
      return const Color(0XFF040D06);
    } else {
      return const Color(0XFF04090D);
    }
  }

  Color get textDark {
    if (mode == PomoMode.focus) {
      return const Color(0XFF471515);
    } else if (mode == PomoMode.shortBreak) {
      return const Color(0XFF14401D);
    } else {
      return const Color(0XFF153047);
    }
  }

  Color get bgPlay {
    if (mode == PomoMode.focus) {
      return Colors.red.withOpacity(.5);
    } else if (mode == PomoMode.longBreak) {
      return Colors.blue.withOpacity(.5);
    } else {
      return Colors.green.withOpacity(.5);
    }
  }

  Color get lightBg {
    if (mode == PomoMode.focus) {
      return const Color(0XFFFFF2F2);
    } else if (mode == PomoMode.shortBreak) {
      return const Color(0XFFF2FFF5);
    } else {
      return const Color(0XFFF2F9FF);
    }
  }

  @override
  List<Object?> get props =>
      [status, mode, focusTime, shortBreakTime, longBreakTime, isAudioOn];
}
