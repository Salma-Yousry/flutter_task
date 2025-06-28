import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../controllers/contact_us_controller.dart';
import 'widget/contact_us_widget.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          AppStrings.contactUs,
          style: TextStyle(color: AppColors.textPrimaryColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppDimensions.paddingLarge(context)),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge(context)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.contact_support, size: 48, color: AppColors.primaryColor),
                  SizedBox(height: AppDimensions.paddingMedium(context)),
                  Text(
                    AppStrings.getInTouch,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: AppDimensions.paddingSmall(context)),
                  Text(
                    AppStrings.contactDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.paddingLarge(context)),
            Text(
              AppStrings.contactMethods,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppDimensions.paddingMedium(context)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.contactMethods.length,
              itemBuilder: (context, index) {
                final method = controller.contactMethods[index];
                return ContactMethodWidget(
                  method: method,
                  onAction: () => controller.handleContactAction(method),
                );
              },
            ),
            SizedBox(height: AppDimensions.paddingLarge(context)),
            Container(
              padding: EdgeInsets.all(AppDimensions.paddingMedium(context)),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info_outline, color: AppColors.primaryColor),
                      SizedBox(width: AppDimensions.paddingSmall(context)),
                      Text(
                        AppStrings.businessHours,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.paddingSmall(context)),
                  Text(
                    AppStrings.businessHoursDetails,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

