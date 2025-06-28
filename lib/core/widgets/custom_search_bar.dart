// lib/app/shared/widgets/custom_search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
        border: Border.all(
          color: AppColors.textSecondaryColor.withOpacity(0.3),
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textSecondaryColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.textSecondaryColor,
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
            icon: Icon(
              Icons.clear,
              color: AppColors.textSecondaryColor,
            ),
            onPressed: () {
              controller.clear();
              if (onClear != null) onClear!();
              if (onChanged != null) onChanged!('');
            },
          )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium(context),
            vertical: AppDimensions.paddingMedium(context),
          ),
        ),
      ),
    );
  }
}