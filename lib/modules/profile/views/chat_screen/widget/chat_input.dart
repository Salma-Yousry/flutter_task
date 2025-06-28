import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_dimensions.dart';
import '../../../controllers/chat_controller.dart';

class ChatInput extends StatelessWidget {
  final ChatController controller;

  const ChatInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.paddingMedium(context),
        AppDimensions.paddingSmall(context),
        AppDimensions.paddingMedium(context),
        AppDimensions.paddingMedium(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Attachment button
            GestureDetector(
              onTap: controller.pickAndSendImage,
              child: Container(
                width: AppDimensions.size(context) * 0.55,
                height: AppDimensions.size(context) * 0.55,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(
                      AppDimensions.radiusLarge(context)),
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.attach_file_rounded,
                  color: AppColors.gray,
                  size: AppDimensions.fontSizeMedium(context),
                ),
              ),
            ),

            SizedBox(width: AppDimensions.paddingSmall(context)),

            // Input field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(
                      AppDimensions.radiusLarge(context)),
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: controller.messageController,
                  onSubmitted: (_) => controller.sendMessage(),
                  decoration: InputDecoration(
                    hintText: 'Write Here...',
                    hintStyle: TextStyle(
                      color: AppColors.textSecondaryColor,
                      fontSize: AppDimensions.fontSizeSmall(context),
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium(context),
                      vertical: AppDimensions.paddingSmall(context),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontSize: AppDimensions.fontSizeSmall(context),
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: null,
                  textInputAction: TextInputAction.send,
                ),
              ),
            ),

            SizedBox(width: AppDimensions.paddingSmall(context)),

            // Send button
            Obx(() => GestureDetector(
              onTap: controller.isLoading.value
                  ? null
                  : controller.sendMessage,
              child: Container(
                width: AppDimensions.size(context) * 0.55,
                height: AppDimensions.size(context) * 0.55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.orange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.radiusLarge(context)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: controller.isLoading.value
                    ? SizedBox(
                  width: AppDimensions.size(context) * 0.25,
                  height: AppDimensions.size(context) * 0.25,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: AppDimensions.fontSizeSmall(context),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
