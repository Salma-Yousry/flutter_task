import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../data/models/contact_model.dart';

class ContactMethodWidget extends StatelessWidget {
  final ContactMethod method;
  final VoidCallback onAction;

  const ContactMethodWidget({
    Key? key,
    required this.method,
    required this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.paddingMedium(context)),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onAction,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium(context)),
          child: Row(
            children: [
              Container(
                width: AppDimensions.size(context),
                height: AppDimensions.size(context),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSmall(context)),
                ),
                child: Icon(
                  _getIconData(method.title),
                  color: AppColors.primaryColor,
                  size: AppDimensions.fontSizeLarge(context),
                ),
              ),
              SizedBox(width: AppDimensions.paddingMedium(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingSmall(context) * 0.5),
                    Text(
                      method.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(
                _getActionIcon(method.action),
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String title) {
    switch (title.toLowerCase()) {
      case AppStrings.customerService:
        return Icons.support_agent;
      case AppStrings.website:
        return Icons.language;
      case AppStrings.facebook:
        return Icons.facebook;
      case AppStrings.whatsapp:
        return Icons.message;
      case AppStrings.instagram:
        return Icons.camera_alt;
      default:
        return Icons.contact_support;
    }
  }

  IconData _getActionIcon(ContactAction action) {
    switch (action) {
      case ContactAction.phone:
        return Icons.phone;
      case ContactAction.email:
        return Icons.email;
      case ContactAction.whatsapp:
        return Icons.message;
      case ContactAction.url:
        return Icons.open_in_new;
    }
  }
}
