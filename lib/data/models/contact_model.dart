enum ContactAction { phone, email, whatsapp, url }

class ContactMethod {
  final String id;
  final String title;
  final String icon;
  final String description;
  final String details;
  final ContactAction action;
  final String value;

  ContactMethod({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
    required this.details,
    required this.action,
    required this.value,
  });
}
