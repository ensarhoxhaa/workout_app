import 'package:flutter/material.dart';
import 'package:workout_app/core/colors/app_colors.dart';

final lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  extensions: const <ThemeExtension<dynamic>>[
    AppColors(
      color1: Colors.orange,
      color2: Colors.yellow,
      color3: Colors.white,
    ),
  ],
);

final darkThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  extensions: const <ThemeExtension<dynamic>>[
    AppColors(
      color1: Colors.red,
      color2: Colors.blue,
      color3: Colors.white,
    ),
  ],
);
