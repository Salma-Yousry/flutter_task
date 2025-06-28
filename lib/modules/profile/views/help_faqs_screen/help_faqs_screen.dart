import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/modules/profile/views/help_faqs_screen/widget/contact_tab.dart';
import 'package:flutter_task/modules/profile/views/help_faqs_screen/widget/faq_tab.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../controllers/help_faqs_controller.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FaqController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimaryColor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          AppStrings.help$Faqs,
          style: AppTextStyles.titleStyle.copyWith(
            color: AppColors.primaryColor,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(AppDimensions.defaultPadding(context)),
            child: Column(
              children: [
                Text(
                  AppStrings.howCanWeHelpYou,
                  style: AppTextStyles.titleStyle.copyWith(
                    fontSize: 16,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(height: AppDimensions.paddingLarge(context)),
                Obx(() => Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.selectedTab.value = 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium(context)),
                          decoration: BoxDecoration(
                            color: controller.selectedTab.value == 0
                                ? AppColors.primaryColor
                                : AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
                          ),
                          child: Text(
                            AppStrings.faqTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.selectedTab.value == 0
                                  ? Colors.white
                                  : AppColors.textSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppDimensions.paddingSmall(context)),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.selectedTab.value = 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium(context)),
                          decoration: BoxDecoration(
                            color: controller.selectedTab.value == 1
                                ? AppColors.primaryColor
                                : AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
                          ),
                          child: Text(
                            AppStrings.contactUsTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: controller.selectedTab.value == 1
                                  ? Colors.white
                                  : AppColors.textSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => controller.selectedTab.value == 0
                ? FaqTab(controller: controller)
                : ContactTab(controller: controller)),
          ),
        ],
      ),
    );
  }
}
