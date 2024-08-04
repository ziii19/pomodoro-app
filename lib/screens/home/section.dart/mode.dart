part of '../page.dart';

class _PomoMode extends StatelessWidget {
  const _PomoMode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomotimerBloc, PomotimerState>(
      builder: (context, state) {
        String titleMode() {
          if (state.mode == PomoMode.focus) {
            return 'Focus Mode';
          } else if (state.mode == PomoMode.longBreak) {
            return 'Long Break';
          } else {
            return 'Short Break';
          }
        }

        Color colorMode() {
          if (state.mode == PomoMode.focus) {
            return Colors.red.withOpacity(.2);
          } else if (state.mode == PomoMode.longBreak) {
            return Colors.blue.withOpacity(.2);
          } else {
            return Colors.green.withOpacity(.2);
          }
        }

        return BlocBuilder<ThemeBloc, bool>(
          builder: (context, isDark) {
            return Container(
              width: MediaQuery.of(context).size.width / 1 / 2,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: colorMode(),
                  border: Border.all(
                      color: isDark ? state.lightBg : state.textDark,
                      width: 2)),
              child: Center(
                child: Text(
                  titleMode(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: isDark ? state.lightBg : state.textDark),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
