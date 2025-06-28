import 'package:flutter/material.dart';
import 'package:flutter_task/modules/profile/views/home_screen/widget/action_card.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../routes/app_routes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.supportCenterTitle,
          style: AppTextStyles.titleStyle.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.defaultPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppDimensions.defaultPadding(context)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.welcomeTitle,
                      style: AppTextStyles.headingStyle.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppStrings.welcomeSubtitle,
                      style: AppTextStyles.bodyStyle,
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppDimensions.paddingLarge(context)),

              // Quick Actions
              Text(
                AppStrings.quickActionsTitle,
                style: AppTextStyles.titleStyle,
              ),
              SizedBox(height: AppDimensions.paddingMedium(context)),

              // Action Cards Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppDimensions.paddingSmall(context),
                  mainAxisSpacing: AppDimensions.paddingSmall(context),
                  childAspectRatio: 1.1,
                  children: [
                    ActionCard(
                      icon: Icons.help_outline,
                      title: AppStrings.faqTitle,
                      subtitle: AppStrings.faqSubtitle,
                      color: AppColors.primaryColor,
                      onTap: () => Get.toNamed(Routes.FAQ),
                    ),
                    ActionCard(
                      icon: Icons.chat_bubble_outline,
                      title: AppStrings.liveChatTitle,
                      subtitle: AppStrings.liveChatSubtitle,
                      color: AppColors.secondaryColor,
                      onTap: () => Get.toNamed(Routes.CHAT),
                    ),
                    ActionCard(
                      icon: Icons.support_agent,
                      title: AppStrings.customerServiceTitle,
                      subtitle: AppStrings.customerServiceSubtitle,
                      color: Colors.blue,
                      onTap: () => Get.toNamed(Routes.CUSTOMER_SERVICE),
                    ),
                    ActionCard(
                      icon: Icons.contact_phone,
                      title: AppStrings.contactUsTitle,
                      subtitle: AppStrings.contactUsSubtitle,
                      color: Colors.green,
                      onTap: () => Get.toNamed(Routes.FAQ, arguments: {'tab': 1}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
