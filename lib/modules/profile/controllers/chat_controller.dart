import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:math';

import '../../../../core/constants/app_strings.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  var messages = <ChatMessage>[].obs;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  var isLoading = false.obs;
  var isTyping = false.obs;

  @override
  void onInit() {
    super.onInit();
    _listenToMessages();
  }

  void _listenToMessages() {
    _firestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      messages.value = snapshot.docs.map((doc) {
        return ChatMessage.fromDocument(doc);
      }).toList();
    });
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    isLoading.value = true;

    try {

      await _firestore.collection('messages').add({
        'senderId': AppStrings.userSenderId,
        'senderName': AppStrings.userSenderName,
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'text',
        'isRead': false,
      });

      messageController.clear();
      _scrollToBottom();


      isTyping.value = true;
      await Future.delayed(Duration(milliseconds: 1000 + Random().nextInt(2000)));
      isTyping.value = false;


      final randomResponse = AppStrings.botResponses[Random().nextInt(AppStrings.botResponses.length)];

      await _firestore.collection('messages').add({
        'senderId': AppStrings.botSenderId,
        'senderName': AppStrings.botSenderName,
        'text': randomResponse,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'text',
        'isRead': false,
      });

      _scrollToBottom();
    } catch (e) {
      Get.snackbar(
        'Error',
        '${AppStrings.errorSendingMessage}$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickAndSendImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (image == null) return;

      isLoading.value = true;

      final String fileName = 'chat_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final Reference storageRef = _storage.ref().child(fileName);
      final UploadTask uploadTask = storageRef.putFile(File(image.path));

      final TaskSnapshot snapshot = await uploadTask;
      final String imageUrl = await snapshot.ref.getDownloadURL();

      await _firestore.collection('messages').add({
        'senderId': AppStrings.userSenderId,
        'senderName': AppStrings.userSenderName,
        'text': '',
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'image',
        'imageUrl': imageUrl,
        'isRead': false,
      });

      _scrollToBottom();


      isTyping.value = true;
      await Future.delayed(Duration(milliseconds: 1500));
      isTyping.value = false;

      await _firestore.collection('messages').add({
        'senderId': AppStrings.botSenderId,
        'senderName': AppStrings.botSenderName,
        'text': AppStrings.imageBotResponse,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'text',
        'isRead': false,
      });

      _scrollToBottom();
    } catch (e) {
      Get.snackbar(
        'Error',
        '${AppStrings.errorUploadingImage}$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }


  Future<void> sendWelcomeMessage() async {
    await Future.delayed(Duration(milliseconds: 500));

    await _firestore.collection('messages').add({
      'senderId': AppStrings.botSenderId,
      'senderName': AppStrings.botSenderName,
      'text': AppStrings.botWelcomeMessage,
      'timestamp': FieldValue.serverTimestamp(),
      'type': 'text',
      'isRead': false,
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

