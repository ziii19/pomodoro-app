part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SaveTheme extends ThemeEvent {
  final bool isDark;

  const SaveTheme({required this.isDark});
}

class GetTheme extends ThemeEvent {}
