import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:svik/presentation/themes/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void toggleTheme() {
    if (state == AppTheme.dark) {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.dark);
    }
  }

  void switchToLight() {
    emit(ThemeMode.light);
  }

  void switchToDark() {
    emit(ThemeMode.dark);
  }

  void switchToSystemDefault() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    emit(ThemeMode.system);
    // isDarkMode?emit(ThemeMode.dark):emit(ThemeMode.light);
  }
}
