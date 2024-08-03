import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro/blocs/blocs.dart';
import 'package:pomodoro/screens/home/page.dart';

import 'widgets/widgets.dart';

void main() {
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
        BlocProvider(create: (context) => PomotimerBloc()),
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

          return MaterialApp(
              theme: theme(),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen());
        },
      ),
    );
  }
}
