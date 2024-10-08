part of '../page.dart';

class _PomoTime extends StatelessWidget {
  const _PomoTime();

  String timeFormat(int seconds) {
    final minute = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minute.toString().padLeft(2, '0')}\n${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomotimerBloc, PomotimerState>(
      builder: (context, state) {
        String time() {
          if (state.mode == PomoMode.focus) {
            return timeFormat(state.focusTime);
          } else if (state.mode == PomoMode.shortBreak) {
            return timeFormat(state.shortBreakTime);
          } else {
            return timeFormat(state.longBreakTime);
          }
        }

        return BlocBuilder<ThemeBloc, bool>(
          builder: (context, isDark) {
            return Text(
              time(),
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 250,
                  height: .9,
                  color: isDark ? state.lightBg : state.textDark),
            );
          },
        );
      },
    );
  }
}
