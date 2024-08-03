import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/timer/timer.dart';

part 'pomotimer_event.dart';
part 'pomotimer_state.dart';

class PomotimerBloc extends Bloc<PomotimerEvent, PomotimerState> {
  PomotimerBloc() : super(PomotimerState.initial()) {
    final setTimer = SetTimer();
    on<StartTimer>((event, emit) {
      setTimer.cancelTimer();
      setTimer.startTimer(
        (timer) {
          add(StartTimer(time: event.time - timer.tick));
        },
      );
      if (event.time > 0) {
        emit(state.copywith(status: Status.running, focusTime: event.time));
      } else {
        setTimer.cancelTimer();
        emit(state.copywith(status: Status.completed, focusTime: 0));
      }
    });
  }
}
