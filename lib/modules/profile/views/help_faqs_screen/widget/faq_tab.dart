import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_strings.dart'; // استيراد AppStrings
import '../../../controllers/help_faqs_controller.dart';
import '../fags_items.dart';

class FaqTab extends StatelessWidget {
  final FaqController controller;
  const FaqTab({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.defaultPadding(context)),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => Row(
                    children: [
                      _buildCategoryChip(AppStrings.generalCategory, 0, context),
                      SizedBox(width: AppDimensions.paddingSmall(context)),
                      _buildCategoryChip(AppStrings.accountCategory, 1, context),
                      SizedBox(width: AppDimensions.paddingSmall(context)),
                      _buildCategoryChip(AppStrings.servicesCategory, 2, context),
                    ],
                  )),
                ),
                SizedBox(height: AppDimensions.paddingMedium(context)),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
                  ),
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: controller.filterFaqs,
                    decoration: InputDecoration(
                      hintText: AppStrings.searchHint,
                      hintStyle: TextStyle(
                        color: AppColors.textSecondaryColor,
                        fontSize: AppDimensions.fontSizeSmall(context),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.textSecondaryColor,
                        size: AppDimensions.fontSizeMedium(context),
                      ),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(AppDimensions.paddingSmall(context)),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: AppDimensions.fontSizeMedium(context),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMedium(context),
                        vertical: AppDimensions.paddingSmall(context),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.paddingLarge(context)),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Obx(() => Column(
              children: controller.filteredFaqs.map((faq) => FaqItem(
                question: faq[AppStrings.question],
                answer: faq[AppStrings.answer],
                isExpanded: controller.expandedItems.contains(faq[AppStrings.id]),
                onTap: () => controller.toggleExpansion(faq[AppStrings.id]),
              )).toList(),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String title, int index, BuildContext context) {
    final isSelected = controller.selectedCategory.value == index;

    return GestureDetector(
      onTap: () => controller.selectedCategory.value = index,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingLarge(context),
          vertical: AppDimensions.paddingSmall(context),
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondaryColor,
            fontSize: AppDimensions.fontSizeSmall(context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
