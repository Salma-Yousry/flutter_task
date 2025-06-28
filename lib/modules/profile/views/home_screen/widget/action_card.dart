import 'package:flutter/material.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_text_styles.dart';


class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const ActionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppDimensions.paddingSmall(context)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimensions.size(context) * 0.8,
              height: AppDimensions.size(context) * 0.8,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
              ),
              child: Icon(
                icon,
                color: color,
                size: AppDimensions.fontSizeLarge(context),
              ),
            ),
            SizedBox(height: AppDimensions.paddingSmall(context)),
            Text(
              title,
              style: AppTextStyles.titleStyle.copyWith(
                fontSize: AppDimensions.fontSizeMedium(context),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.paddingExtraSmall(context)),
            Text(
              subtitle,
              style: AppTextStyles.captionStyle.copyWith(
                fontSize: AppDimensions.fontSizeSmall(context),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
