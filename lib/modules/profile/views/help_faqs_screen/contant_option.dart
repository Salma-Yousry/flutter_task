import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_text_styles.dart';

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ContactOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium(context),
        vertical: AppDimensions.paddingSmall(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: Container(
          width: AppDimensions.size(context),
          height: AppDimensions.size(context),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: AppDimensions.fontSizeLarge(context) * 0.75,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: AppDimensions.fontSizeMedium(context),
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryColor,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.textSecondaryColor,
          size: AppDimensions.fontSizeLarge(context),
        ),
        onTap: onTap,
      ),
    );
  }
}
