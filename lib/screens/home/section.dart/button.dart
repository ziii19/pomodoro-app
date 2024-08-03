part of '../page.dart';

class _PomoButton extends StatefulWidget {
  const _PomoButton();

  @override
  State<_PomoButton> createState() => _PomoButtonState();
}

class _PomoButtonState extends State<_PomoButton> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomotimerBloc, PomotimerState>(
      builder: (context, state) {
        void timerEvent() {
          if (state.status == Status.initial || state.status == Status.paused) {
            if (state.mode == PomoMode.focus) {
              context
                  .read<PomotimerBloc>()
                  .add(StartTimer(time: state.focusTime));
            } else if (state.mode == PomoMode.shortBreak) {
              context
                  .read<PomotimerBloc>()
                  .add(StartTimer(time: state.shortBreakTime));
            } else {
              context
                  .read<PomotimerBloc>()
                  .add(StartTimer(time: state.longBreakTime));
            }
          } else if (state.status == Status.completed) {
            context.read<PomotimerBloc>().add(ResetTimer());
          } else {
            context.read<PomotimerBloc>().add(PausedTimer());
          }
        }

        IconData timerIcon() {
          if (state.status == Status.initial || state.status == Status.paused) {
            return Icons.play_arrow_rounded;
          } else if (state.status == Status.completed) {
            return Icons.refresh_rounded;
          } else {
            return Icons.pause_rounded;
          }
        }

        Color colorButton() {
          if (state.mode == PomoMode.focus) {
            return Colors.red.withOpacity(.5);
          } else if (state.mode == PomoMode.longBreak) {
            return Colors.blue.withOpacity(.5);
          } else {
            return Colors.green.withOpacity(.5);
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

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTime(
              icon: Icons.more_horiz_rounded,
              bgColor: colorMode(),
              onTap: () {
                openSetting();
              },
            ),
            const SizedBox(width: 20),
            ButtonTime(
                isBig: true,
                icon: timerIcon(),
                bgColor: colorButton(),
                onTap: () {
                  timerEvent();
                }),
            const SizedBox(width: 20),
            ButtonTime(
              icon: Icons.fast_forward_rounded,
              bgColor: colorMode(),
              onTap: () {
                context.read<PomotimerBloc>().add(ChangeMode());
              },
            ),
          ],
        );
      },
    );
  }

  void openSetting() {
    showDialog(context: context, builder: (context) => const SettingsMenu());
  }
}
