import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/colors/app_colors.dart';
import 'package:workout_app/core/theme/app_themes.dart';

class ThemeModeNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, bool>(() {
  return ThemeModeNotifier();
});
