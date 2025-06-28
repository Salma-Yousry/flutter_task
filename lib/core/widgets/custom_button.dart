import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_dimensions.dart';

import '../constants/app_colors.dart';


class CustomElevatedButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          foregroundColor: textColor ?? Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.paddingMedium(context),
            horizontal: AppDimensions.paddingLarge(context),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon),
              SizedBox(width: AppDimensions.paddingSmall(context)),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: AppDimensions.fontSizeMedium(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
