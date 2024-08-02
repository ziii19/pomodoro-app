import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<SaveTheme>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDark', event.isDark);
      emit(event.isDark);
    });

    on<GetTheme>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

      if (isFirstLaunch) {
        final Brightness brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        final isDark = brightness == Brightness.dark;

        await prefs.setBool('isDark', isDark);
        await prefs.setBool('isFirstLaunch', false);
        emit(isDark);
      } else {
        final isDark = prefs.getBool('isDark') ?? false;
        emit(isDark);
      }
    });
  }
}
