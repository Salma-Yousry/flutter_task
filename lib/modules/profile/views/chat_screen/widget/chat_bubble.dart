import 'package:flutter/material.dart';
import '../../../../../../data/models/chat_message_model.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_dimensions.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUser = message.senderId == 'user';

    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.paddingLarge(context)),
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isUser) ...[
                Container(
                  width: AppDimensions.size(context) * 0.4,
                  height: AppDimensions.size(context) * 0.4,
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
                        AppDimensions.radiusMedium(context)),
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
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: AppDimensions.paddingSmall(context)),
              ],

              // Message Bubble
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium(context),
                    vertical: AppDimensions.paddingSmall(context),
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? AppColors.primaryColor
                        : AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomLeft: isUser
                          ? Radius.circular(18)
                          : Radius.circular(4),
                      bottomRight: isUser
                          ? Radius.circular(4)
                          : Radius.circular(18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      if (message.type == MessageType.image &&
                          message.imageUrl != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.radiusMedium(context)),
                          child: Image.network(
                            message.imageUrl!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusMedium(context)),
                                  ),
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.grey[600],
                                    size: AppDimensions.fontSizeXLarge(context),
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.paddingSmall(context)),
                      ],

                      // Text
                      if (message.text.isNotEmpty)
                        Text(
                          message.text,
                          style: TextStyle(
                            color: isUser
                                ? Colors.white
                                : AppColors.textPrimaryColor,
                            fontSize: AppDimensions.fontSizeSmall(context),
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // User avatar (right)
              if (isUser) ...[
                SizedBox(width: AppDimensions.paddingSmall(context)),
                Container(
                  width: AppDimensions.size(context) * 0.4,
                  height: AppDimensions.size(context) * 0.4,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF667EEA),
                        Color(0xFF764BA2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium(context)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF667EEA).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),

          // Timestamp
          Padding(
            padding: EdgeInsets.only(
              top: AppDimensions.paddingExtraSmall(context),
              left: isUser ? 0 : AppDimensions.size(context) * 0.5,
              right: isUser ? AppDimensions.size(context) * 0.5 : 0,
            ),
            child: Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                color: AppColors.textSecondaryColor,
                fontSize: AppDimensions.fontSizeSmall(context) * 0.8,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
