import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { text, image, system }

class ChatMessage {
  final String id;
  final String text;
  final String senderId;
  final String senderName;
  final DateTime timestamp;
  final MessageType type;
  final String? imageUrl;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.text,
    required this.senderId,
    required this.senderName,
    required this.timestamp,
    this.type = MessageType.text,
    this.imageUrl,
    this.isRead = false,
  });

  // بناء من وثيقة Firestore مع id من doc.id
  factory ChatMessage.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return ChatMessage(
      id: doc.id,
      text: data['text'] ?? '',
      senderId: data['senderId'] ?? '',
      senderName: data['senderName'] ?? '',
      timestamp: _parseTimestamp(data['timestamp']),
      type: _parseMessageType(data['type']),
      imageUrl: data['imageUrl'],
      isRead: data['isRead'] ?? false,
    );
  }

  // بناء من JSON عام (يمكن تستخدمه لو تجيب البيانات من مكان آخر)
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      timestamp: _parseTimestamp(json['timestamp']),
      type: _parseMessageType(json['type']),
      imageUrl: json['imageUrl'],
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderId': senderId,
      'senderName': senderName,
      'timestamp': Timestamp.fromDate(timestamp),
      'type': type.toString().split('.').last,
      'imageUrl': imageUrl,
      'isRead': isRead,
    };
  }

  ChatMessage copyWith({
    String? id,
    String? text,
    String? senderId,
    String? senderName,
    DateTime? timestamp,
    MessageType? type,
    String? imageUrl,
    bool? isRead,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      isRead: isRead ?? this.isRead,
    );
  }

  // دوال مساعدة لتحويل القيم بأمان

  static DateTime _parseTimestamp(dynamic value) {
    if (value == null) {
      return DateTime.now();
    } else if (value is Timestamp) {
      return value.toDate();
    } else if (value is DateTime) {
      return value;
    } else {
      return DateTime.now();
    }
  }

  static MessageType _parseMessageType(dynamic value) {
    if (value == null) return MessageType.text;
    try {
      return MessageType.values.firstWhere(
              (e) => e.toString().split('.').last.toLowerCase() == value.toString().toLowerCase());
    } catch (_) {
      return MessageType.text;
    }
  }
}
