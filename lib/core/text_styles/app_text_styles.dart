import 'package:flutter/material.dart';

const TextStyle headlineLarge = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 32,
  fontWeight: FontWeight.w700,
);
const TextStyle bodyMedium = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18,
  fontWeight: FontWeight.w600,
  height: 1.2,
);
const TextStyle bodySmall = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 12,
  fontWeight: FontWeight.w500,
  height: 1.2,
);

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle? headlineLarge;
  final TextStyle? bodyMedium;
  final TextStyle? bodySmall;

  const AppTextStyles({
    required this.headlineLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? headlineLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) {
    return AppTextStyles(
      headlineLarge: headlineLarge ?? this.headlineLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t),
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t),
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t),
    );
  }
}
