import 'package:flutter/material.dart';
import 'package:workout_app/core/colors/app_colors.dart';
import 'package:workout_app/core/text_styles/app_text_styles.dart';

final lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightThemePrimaryColor,
    background: lightThemeBackgroundColor,
  ),
  useMaterial3: true,
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      primaryColor: lightThemePrimaryColor,
      secondaryColor: lightThemeSecondaryColor,
      backgroundColor: lightThemeBackgroundColor,
    ),
    AppTextStyles(
      headlineLarge: headlineLarge.copyWith(color: lightThemeTextColor),
      bodyMedium: bodyMedium.copyWith(color: lightThemeTextColor),
      bodySmall: bodySmall.copyWith(color: lightThemeTextColor),
    ),
  ],
);

final darkThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: darkThemePrimaryColor,
    background: darkThemeBackgroundColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  extensions: <ThemeExtension<dynamic>>[
    const AppColors(
      primaryColor: darkThemePrimaryColor,
      secondaryColor: darkThemeSecondaryColor,
      backgroundColor: darkThemeBackgroundColor,
    ),
    AppTextStyles(
      headlineLarge: headlineLarge.copyWith(color: darkThemeTextColor),
      bodyMedium: bodyMedium.copyWith(color: darkThemeTextColor),
      bodySmall: bodySmall.copyWith(color: darkThemeTextColor),
    ),
  ],
);
