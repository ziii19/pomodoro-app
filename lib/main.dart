import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/blocs/blocs.dart';
import 'package:pomodoro/screens/home/page.dart';

import 'widgets/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Bloc.observer = AppBlockObserver();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()..add(GetTheme())),
        BlocProvider(
            create: (context) => PomotimerBloc()..add(LoadisAudioOn())),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDark) {
          ThemeData theme() {
            if (isDark) {
              return ThemeData.dark(useMaterial3: true);
            } else {
              return ThemeData.light(useMaterial3: true);
            }
          }

          return BlocBuilder<PomotimerBloc, PomotimerState>(
            builder: (context, state) {
              String timeFormat(int seconds) {
                final minute = seconds ~/ 60;
                final remainingSeconds = seconds % 60;
                return '${minute.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
              }

              String time() {
                if (state.mode == PomoMode.focus) {
                  return 'Focus - ${timeFormat(state.focusTime)}';
                } else if (state.mode == PomoMode.shortBreak) {
                  return 'Short Break - ${timeFormat(state.shortBreakTime)}';
                } else {
                  return 'Long Break - ${timeFormat(state.longBreakTime)}';
                }
              }

              String title() {
                if (state.status == Status.running) {
                  return time();
                } else {
                  return 'Pomodoro';
                }
              }

              return MaterialApp(
                  title: title(),
                  theme: theme(),
                  debugShowCheckedModeBanner: false,
                  home: const HomeScreen());
            },
          );
        },
      ),
    );
  }
}
