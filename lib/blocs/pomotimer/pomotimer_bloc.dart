import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
        if (state.mode == PomoMode.focus) {
          emit(state.copywith(status: Status.running, focusTime: event.time));
        } else if (state.mode == PomoMode.shortBreak) {
          emit(state.copywith(
              status: Status.running, shortBreakTime: event.time));
        } else {
          emit(state.copywith(
              status: Status.running, longBreakTime: event.time));
        }
      } else {
        setTimer.cancelTimer();
        if (state.mode == PomoMode.focus) {
          emit(state.copywith(status: Status.completed, focusTime: 0));
        } else if (state.mode == PomoMode.shortBreak) {
          emit(state.copywith(status: Status.completed, shortBreakTime: 0));
        } else {
          emit(state.copywith(status: Status.completed, longBreakTime: 0));
        }
      }
    });

    on<PausedTimer>((event, emit) {
      setTimer.cancelTimer();
      emit(state.copywith(status: Status.paused));
    });

    on<ChangeMode>((event, emit) {
      if (state.mode == PomoMode.focus) {
        setTimer.cancelTimer();
        emit(state.copywith(mode: PomoMode.shortBreak, status: Status.paused));
      } else if (state.mode == PomoMode.shortBreak) {
        setTimer.cancelTimer();
        emit(state.copywith(mode: PomoMode.longBreak, status: Status.paused));
      } else {
        setTimer.cancelTimer();
        emit(state.copywith(mode: PomoMode.focus, status: Status.paused));
      }
    });

    on<ResetTimer>((event, emit) {
      emit(PomotimerState.initial());
    });

    on<UpdateTime>((event, emit) {
      emit(state.copywith(
        focusTime: event.focusTime,
        shortBreakTime: event.shortBreakTime,
        longBreakTime: event.longBreakTime,
      ));
    });
  }
}
