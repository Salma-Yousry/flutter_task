import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../controllers/help_faqs_controller.dart';
import '../contant_option.dart';


class ContactTab extends StatelessWidget {
  final FaqController controller;
  const ContactTab({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: AppDimensions.paddingLarge(context)),
          ...controller.contactOptions.map(
                (option) => ContactOption(
              icon: option[AppStrings.icon],
              title: option[AppStrings.title],
              onTap: () => controller.handleContactOption(AppStrings.title),
            ),
          ),
        ],
      ),
    );
  }
}
