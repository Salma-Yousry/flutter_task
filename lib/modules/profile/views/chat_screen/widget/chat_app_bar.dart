import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../controllers/chat_controller.dart';


class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatController controller;

  const ChatAppBar({super.key, required this.controller});

  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.darkBlue,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.paddingMedium(context)),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: AppDimensions.size(context),
                        height: AppDimensions.size(context),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryColor, AppColors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius:
                          BorderRadius.circular(AppDimensions.radiusLarge(context)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.support_agent,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: AppDimensions.paddingMedium(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.assistantName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.darkBlue),
                            ),
                            SizedBox(height: AppDimensions.paddingExtraSmall(context)),
                            Obx(() => Text(
                              controller.isTyping.value
                                  ? AppStrings.typing
                                  : AppStrings.assistantAvailable,
                              style: TextStyle(
                                fontSize: AppDimensions.fontSizeSmall(context),
                                fontWeight: FontWeight.w400,
                                color: controller.isTyping.value
                                    ? AppColors.primaryColor
                                    : AppColors.borderColor,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.size(context) * 0.33,
                  height: AppDimensions.size(context) * 0.33,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMedium(context)),
                  ),
                  child: const Icon(
                    Icons.more_vert,
                    color: AppColors.gray,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
