import 'package:flutter/material.dart';
import 'package:workout_app/core/core.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
}

extension FocusScopeExtension on BuildContext {
  FocusScopeNode get focusScope => FocusScope.of(this);
}