import 'dart:async';

class SetTimer {
  Timer? _timer;

  void startTimer(void Function(Timer) updateTime) {
    _timer = Timer.periodic(const Duration(seconds: 1), updateTime);
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}
