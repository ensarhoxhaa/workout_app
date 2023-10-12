import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required String message,
    required VoidCallback onTap,
    super.key,
  }) : super(
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(seconds: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.symmetric(
      vertical: 24,
      horizontal: 400,
    ),
    behavior: SnackBarBehavior.floating,
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Text(
            message,
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onTap,
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
