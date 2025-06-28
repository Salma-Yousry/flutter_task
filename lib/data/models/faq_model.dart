class FaqModel {
  final String id;
  final String question;
  final String answer;
  final String category;
  final List<String> tags;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    required this.tags,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      category: json['category'],
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
      'tags': tags,
    };
  }
}
