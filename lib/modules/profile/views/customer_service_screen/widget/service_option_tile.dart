import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';

class ServiceOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ServiceOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: AppDimensions.fontSizeMedium(context),
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: AppDimensions.fontSizeSmall(context),
            color: AppColors.textSecondaryColor,
          ),
        ),
        trailing: Container(
          width: AppDimensions.size(context),
          height: AppDimensions.size(context),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
          ),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: AppDimensions.fontSizeSmall(context),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
