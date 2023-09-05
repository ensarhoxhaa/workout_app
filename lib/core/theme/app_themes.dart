import 'package:flutter/material.dart';
import 'package:workout_app/core/colors/app_colors.dart';

final lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    background: Colors.white,
  ),
  useMaterial3: true,
  extensions: const <ThemeExtension<dynamic>>[
    AppColors(
      color1: Colors.orange,
      color2: Colors.yellow,
      color3: Colors.white,
    ),
  ],
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black54,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  ),
);

final darkThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    background: Colors.black26,
  ),
  useMaterial3: true,
  extensions: const <ThemeExtension<dynamic>>[
    AppColors(
      color1: Colors.red,
      color2: Colors.blue,
      color3: Colors.white,
    ),
  ],
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white70,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  ),
);
