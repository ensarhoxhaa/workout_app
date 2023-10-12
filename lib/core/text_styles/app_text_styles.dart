import 'package:flutter/material.dart';

const TextStyle headlineLarge = TextStyle(
  fontFamily: 'Segoe',
  fontSize: 32,
  fontWeight: FontWeight.w600,
);

const TextStyle bodyLarge = TextStyle(
  fontSize: 24,
  fontFamily: 'Segoe',
  fontWeight: FontWeight.w600,
);

const TextStyle headlineMedium = TextStyle(
  fontSize: 20,
  fontFamily: 'Segoe',
  fontWeight: FontWeight.w700,
);

const TextStyle bodySmall = TextStyle(
  fontSize: 14,
  fontFamily: 'Segoe',
  fontWeight: FontWeight.w400,
);

const TextStyle bodyMedium = TextStyle(
  fontSize: 18,
  fontFamily: 'Segoe',
  fontWeight: FontWeight.w600,
);

class AppTextStyles extends ThemeExtension<AppTextStyles> {

  const AppTextStyles({
    required this.headlineLarge,
    required this.bodyLarge,
    required this.bodySmall,
    required this.bodyMedium,
    required this.headlineMedium,
  });

  final TextStyle? headlineLarge;
  final TextStyle? bodyLarge;
  final TextStyle? bodySmall;
  final TextStyle? bodyMedium;
  final TextStyle? headlineMedium;

  @override
  AppTextStyles copyWith({
    TextStyle? headlineLarge,
    TextStyle? bodyLarge,
    TextStyle? bodySmall,
    TextStyle? bodyMedium,
    TextStyle? headlineMedium,
  }) {
    return AppTextStyles(
      headlineLarge: headlineLarge ?? this.headlineLarge,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodySmall: bodySmall ?? this.bodySmall,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      headlineMedium: headlineMedium ?? this.headlineMedium,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t),
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t),
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t),
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t),
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t),
    );
  }
}
