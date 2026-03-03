class Reminder {
  String id;
  String type;
  DateTime time;
  bool enabled;
  String repeat;

  Reminder({
    required this.id,
    required this.type,
    required this.time,
    this.enabled = true,
    this.repeat = 'none',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'time': time.toIso8601String(),
      'enabled': enabled,
      'repeat': repeat,
    };
  }

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'],
      type: json['type'],
      time: DateTime.parse(json['time']),
      enabled: json['enabled'] ?? true,
      repeat: json['repeat'] ?? 'none',
    );
  }
}