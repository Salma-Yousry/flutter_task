import 'package:flutter/material.dart';
import 'package:flutter_task/modules/profile/views/chat_screen/widget/chat_app_bar.dart';
import 'package:flutter_task/modules/profile/views/chat_screen/widget/chat_bubble.dart';
import 'package:flutter_task/modules/profile/views/chat_screen/widget/chat_empty_state.dart';
import 'package:flutter_task/modules/profile/views/chat_screen/widget/chat_input.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../controllers/chat_controller.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.borderColor,
      appBar: ChatAppBar(controller: controller),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 1,
              color: const Color(0xFFE2E8F0),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Obx(() => controller.messages.isEmpty
                    ? ChatEmptyState()
                    : ListView.builder(
                  controller: controller.scrollController,
                  reverse: true,
                  padding:
                  EdgeInsets.all(AppDimensions.paddingMedium(context)),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return ChatBubble(message: message);
                  },
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ChatInput(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
