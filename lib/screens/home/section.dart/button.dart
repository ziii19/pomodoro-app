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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTime(
          icon: Icons.more_horiz_rounded,
          bgColor: Colors.red.withOpacity(.2),
          onTap: () {
            openSetting();
          },
        ),
        const SizedBox(width: 20),
        BlocBuilder<PomotimerBloc, PomotimerState>(
          builder: (context, state) {
            return ButtonTime(
              isBig: true,
              icon: Icons.play_arrow_rounded,
              bgColor: Colors.red.withOpacity(.5),
              onTap: () {
                context
                    .read<PomotimerBloc>()
                    .add(StartTimer(time: state.focusTime));
              },
            );
          },
        ),
        const SizedBox(width: 20),
        ButtonTime(
          icon: Icons.fast_forward_rounded,
          bgColor: Colors.red.withOpacity(.2),
          onTap: () {},
        ),
      ],
    );
  }

  void openSetting() {
    showDialog(context: context, builder: (context) => const SettingsMenu());
  }
}

