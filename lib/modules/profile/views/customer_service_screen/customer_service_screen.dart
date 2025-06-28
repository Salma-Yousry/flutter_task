import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_text_styles.dart';
import 'package:flutter_task/modules/profile/views/customer_service_screen/widget/service_option_tile.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_strings.dart';
import '../chat_screen/chat_screen.dart';


class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          AppStrings.customerService,
          style: AppTextStyles.titleStyle.copyWith(
            color: AppColors.primaryColor,
            fontSize: AppDimensions.fontSizeMedium(context),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.paddingLarge(context),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium(context),
              ),
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
            ),

            SizedBox(height: AppDimensions.paddingLarge(context)),

            // Options
            ServiceOptionTile(
              title: AppStrings.howCanWeHelp,
              subtitle: AppStrings.support,
              onTap: () => Get.to(() => const ChatScreen()),
            ),

            SizedBox(height: AppDimensions.paddingMedium(context)),

            ServiceOptionTile(
              title: AppStrings.helpCenter,
              subtitle: AppStrings.generalInfo,
              onTap: () {
                // TODO: navigate to Help Center
              },
            ),
          ],
        ),
      ),
    );
  }
}
