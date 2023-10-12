import 'package:flutter/material.dart';
import 'package:workout_app/core/core.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onTap,
    required this.isEnabled,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 56,
      minWidth: double.infinity,
      color: context.colors.primaryColor,
      disabledColor: context.colors.primaryColor!.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: isEnabled ? onTap : null,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.bodyMedium!.copyWith(
          color: context.colors.secondaryColor,
        ),
      ),
    );
  }
}
