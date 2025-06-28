import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_text_styles.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyStyle.copyWith(
            fontSize: 12,
            color: AppColors.textSecondaryColor,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
            prefixIcon,
            color: AppColors.textSecondaryColor,
            size: 20,
          )
              : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
            onTap: onSuffixTap,
            child: Icon(
              suffixIcon,
              color: AppColors.textSecondaryColor,
              size: 20,
            ),
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}