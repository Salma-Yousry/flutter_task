import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/constants/app_strings.dart';

class CustomerServiceHeader extends StatelessWidget {
  const CustomerServiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.defaultPadding(context)),
      child: Column(
        children: [
          Text(
            AppStrings.greeting,
            style: AppTextStyles.titleStyle.copyWith(
              fontSize: AppDimensions.fontSizeMedium(context),
              color: AppColors.textPrimaryColor,
            ),
          ),
          SizedBox(height: AppDimensions.paddingMedium(context)),
          Text(
            AppStrings.description,
            style: TextStyle(
              fontSize: AppDimensions.fontSizeMedium(context),
              color: AppColors.textSecondaryColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
