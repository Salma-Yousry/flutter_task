import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/faq_model.dart';

class FaqItemWidget extends StatelessWidget {
  final FaqModel faq;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqItemWidget({
    Key? key,
    required this.faq,
    required this.isExpanded,
    required this.onTap,
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
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium(context)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faq.question,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: AppDimensions.paddingSmall(context)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingSmall(context),
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall(context)),
                          ),
                          child: Text(
                            faq.category,
                            style: TextStyle(
                              fontSize: AppDimensions.fontSizeSmall(context),
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium(context)),
              child: Text(
                faq.answer,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

