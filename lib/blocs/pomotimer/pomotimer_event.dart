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
