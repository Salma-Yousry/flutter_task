// lib/app/data/services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../../data/models/chat_message_model.dart';
import '../../data/models/faq_model.dart';


class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  // FAQ Services
  static Future<List<FaqModel>> getFaqs() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('faqs').get();
      return snapshot.docs
          .map((doc) => FaqModel.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>
      }))
          .toList();
    } catch (e) {
      print('Error getting FAQs: $e');
      return [];
    }
  }

  static Future<void> addFaq(FaqModel faq) async {
    try {
      await _firestore.collection('faqs').add(faq.toJson());
    } catch (e) {
      print('Error adding FAQ: $e');
    }
  }
  // Chat Services
  static Stream<List<ChatMessage>> getChatMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => ChatMessage.fromJson({
      'id': doc.id,
      ...doc.data()
    }))
        .toList());
  }

  static Future<void> sendMessage(String chatId, ChatMessage message) async {
    try {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(message.toJson());

      // Update chat metadata
      await _firestore.collection('chats').doc(chatId).set({
        'lastMessage': message.text,
        'lastMessageTime': message.timestamp,
        'participants': message.senderId == 'user' ? ['user', 'support'] : ['support', 'user'],
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  static Future<String> uploadImage(File imageFile, String path) async {
    try {
      TaskSnapshot snapshot = await _storage.ref(path).putFile(imageFile);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }
}
