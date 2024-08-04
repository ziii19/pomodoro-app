part of '../page.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key});

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, isDark) {
        return BlocBuilder<PomotimerBloc, PomotimerState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black.withOpacity(.1)),
              child: Dialog(
                backgroundColor: isDark ? state.darkBg : state.lightBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Setting',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDark ? state.lightBg : state.textDark),
                          ),
                          GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.close_rounded))
                        ],
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<ThemeBloc, bool>(
                        builder: (context, isDark) {
                          return SwitchTile(
                            title: 'Dark mode',
                            initialValue: isDark,
                            onChanged: (value) {
                              context
                                  .read<ThemeBloc>()
                                  .add(SaveTheme(isDark: value));
                            },
                          );
                        },
                      ),
                      CustomNumberInputTile(
                        title: 'Focus length',
                        initialValue:
                            state.focusTime != 0 ? state.focusTime ~/ 60 : 25,
                        minValue: 10,
                        maxValue: 60,
                        onChanged: (value) {
                          // Logic to change focus length
                          context
                              .read<PomotimerBloc>()
                              .add(UpdateTime(focusTime: value * 60));
                        },
                      ),
                      CustomNumberInputTile(
                        title: 'Short break length',
                        initialValue: state.shortBreakTime != 0
                            ? state.shortBreakTime ~/ 60
                            : 5,
                        minValue: 1,
                        maxValue: 15,
                        onChanged: (value) {
                          // Logic to change short break length
                          context
                              .read<PomotimerBloc>()
                              .add(UpdateTime(shortBreakTime: value * 60));
                        },
                      ),
                      CustomNumberInputTile(
                        title: 'Long break length',
                        initialValue: state.longBreakTime != 0
                            ? state.longBreakTime ~/ 60
                            : 15,
                        minValue: 10,
                        maxValue: 30,
                        onChanged: (value) {
                          // Logic to change long break length
                          context
                              .read<PomotimerBloc>()
                              .add(UpdateTime(longBreakTime: value * 60));
                        },
                      ),
                      SwitchTile(
                        title: 'Sound',
                        initialValue: state.isAudioOn,
                        onChanged: (value) {
                          context
                              .read<PomotimerBloc>()
                              .add(SaveisAudioOn(isAudioOn: value));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
