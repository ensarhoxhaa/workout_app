import 'package:flutter/material.dart';
import 'package:workout_app/core/core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.textInputAction,
    this.onTap,
    this.floatingLabelBehavior,
    this.bottomScrollPadding = 0,
    this.obscureText = false,
    this.errorText,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final String? hintText;
  final VoidCallback? onTap;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final double bottomScrollPadding;
  final bool obscureText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      onTap: onTap,
      onChanged: onChanged,
      textInputAction: textInputAction,
      controller: controller,
      obscureText: obscureText,
      scrollPadding: EdgeInsets.only(bottom: bottomScrollPadding),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintStyle: context.textStyles.bodySmall!
            .copyWith(color: context.colors.secondaryColor),
        errorText: errorText,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: context.colors.primaryColor!,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: context.colors.secondaryColor!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: context.colors.secondaryColor!,
          ),
        ),
        floatingLabelBehavior: floatingLabelBehavior,
      ),
    );
  }
}
