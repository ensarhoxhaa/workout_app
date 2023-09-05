import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:workout_app/core/colors/app_colors.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}