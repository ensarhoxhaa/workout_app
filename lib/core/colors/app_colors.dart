import 'package:flutter/material.dart';

const Color lightThemePrimaryColor = Colors.deepPurple;
const Color lightThemeSecondaryColor = Color(0xff9da3d5);
const Color lightThemeBackgroundColor = Color(0xffffffff);
const Color lightThemeTextColor = Color(0xff000000);

const Color darkThemePrimaryColor = Colors.redAccent;
const Color darkThemeSecondaryColor = Color(0xfffc797d);
const Color darkThemeBackgroundColor = Color(0xff232323);
const Color darkThemeTextColor = Color(0xffffffff);

class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;

  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}