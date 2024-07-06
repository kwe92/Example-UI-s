import 'dart:convert';

class AppNotification {
  final int id;
  final String message;

  const AppNotification({
    required this.id,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
    };
  }

  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      id: map['id']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppNotification.fromJson(String source) => AppNotification.fromMap(json.decode(source));

  @override
  String toString() => 'Notification(id: $id, message: $message)';
}
