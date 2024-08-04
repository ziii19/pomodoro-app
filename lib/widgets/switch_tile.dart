import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/blocs/blocs.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, isDark) {
        return BlocBuilder<PomotimerBloc, PomotimerState>(
          builder: (context, state) {
            return ListTile(
              title: Text(title,
                  style: TextStyle(
                      color: isDark ? state.lightBg : state.textDark)),
              trailing: Switch(
                activeColor: state.bgPlay,
                thumbColor: WidgetStatePropertyAll(
                    isDark ? state.darkBg : state.lightBg),
                value: initialValue,
                onChanged: onChanged,
              ),
            );
          },
        );
      },
    );
  }
}
