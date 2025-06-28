import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_text_styles.dart';

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqItem({
    Key? key,
    required this.question,
    required this.answer,
    required this.isExpanded,
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
      child: Column(
        children: [
          ListTile(
            title: Text(
              question,
              style: AppTextStyles.titleStyle.copyWith(
                fontSize: AppDimensions.fontSizeMedium(context),
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryColor,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.textSecondaryColor,
              size: AppDimensions.fontSizeLarge(context),
            ),
            onTap: onTap,
          ),
          if (isExpanded)
            Container(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.paddingMedium(context),
                0,
                AppDimensions.paddingMedium(context),
                AppDimensions.paddingMedium(context),
              ),
              child: Text(
                answer,
                style: AppTextStyles.bodyStyle.copyWith(
                  fontSize: AppDimensions.fontSizeSmall(context),
                  color: AppColors.textSecondaryColor,
                  height: 2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
