part of '../page.dart';

class _PomoMode extends StatelessWidget {
  const _PomoMode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomotimerBloc, PomotimerState>(
      builder: (context, state) {
        String titleMode() {
          if (state.mode == PomoMode.focus) {
            return 'Focus';
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

        IconData icon() {
          if (state.mode == PomoMode.focus) {
            return UniconsLine.brain;
          } else {
            return UniconsLine.coffee;
          }
        }

        return BlocBuilder<ThemeBloc, bool>(
          builder: (context, isDark) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width / 1 / 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: colorMode(),
                      border: Border.all(
                          color: isDark ? state.lightBg : state.textDark,
                          width: 2)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon(),
                          size: 35,
                          color: isDark ? state.lightBg : state.textDark,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          titleMode(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: isDark ? state.lightBg : state.textDark),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
