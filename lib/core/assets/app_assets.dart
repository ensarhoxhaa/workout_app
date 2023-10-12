import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class $AssetsIcons {
  const $AssetsIcons();

  /// File path: assets/icons/lock_icon.svg
  String get lockIcon => 'assets/icons/lock_icon.svg';

  /// File path: assets/icons/email_icon.svg
  String get emailIcon => 'assets/icons/email_icon.svg';
}

class $AssetsImages {
  const $AssetsImages();

  /// File path: assets/images/login_screen_background.png
  String get loginScreenBackground => 'assets/images/login_screen_background.png';
}

class Assets {
  const Assets._();

  static const $AssetsIcons icons = $AssetsIcons();
  static const $AssetsImages images = $AssetsImages();

  static Widget fromSvg({
    required String svgPath,
    Color? color,
    Key? key,
    double padding = 0,
    BoxFit? fit,
    BlendMode blendMode = BlendMode.srcIn,
  }) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        key: key,
        svgPath,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(
          color,
          blendMode,
        ),
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
