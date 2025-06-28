import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_strings.dart';


class ChatEmptyState extends StatelessWidget {
  const ChatEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: AppDimensions.size(context) * 0.67,
            height: AppDimensions.size(context) * 0.67,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor.withOpacity(0.1),
                  AppColors.orange.withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.paddingMedium(context)),
            ),
            child: const Icon(
              Icons.chat_bubble_outline,
              color: AppColors.primaryColor,
              size: 40,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            AppStrings.startConversation,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.darkBlue,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            AppStrings.sendMessagePrompt,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.gray,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
