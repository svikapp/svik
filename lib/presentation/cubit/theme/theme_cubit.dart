import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:svik2/presentation/themes/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.light);

  void toggleTheme() {
    if (state == AppTheme.dark) {
      emit(AppTheme.light);
    } else {
      emit(AppTheme.dark);
    }
  }
}
