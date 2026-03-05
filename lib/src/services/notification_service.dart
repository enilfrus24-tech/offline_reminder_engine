import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../models/reminder.dart';

class NotificationService {

  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  /// Initialize notification engine
  static Future<void> init() async {

    if (_initialized) return;

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);
    const androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings = InitializationSettings(
      android: androidSettings,
    );

    await _notifications.initialize(settings);

    const AndroidNotificationChannel channel =
    AndroidNotificationChannel(
      'reminders',
      'Reminders',
      description: 'Reminder notifications',
      importance: Importance.max,
    );

    final android = _notifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await android?.createNotificationChannel(channel);

    _initialized = true;
  }

  /// Cancel all notifications
  static Future<void> cancelAll() async {
    await _notifications.cancelAll();
  }

  /// Cancel one reminder
  static Future<void> cancelReminder(Reminder reminder) async {
    await _notifications.cancel(reminder.id.hashCode);
  }

  /// Schedule reminder
  static Future<void> scheduleReminder(Reminder reminder) async {

    final now = tz.TZDateTime.now(tz.local);

    tz.TZDateTime scheduled =
    tz.TZDateTime.from(reminder.time, tz.local);

    // If scheduled time already passed → move to next minute
    if (scheduled.isBefore(now)) {
      scheduled = now.add(const Duration(seconds: 10));
    }
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'reminders',
        'Reminders',
        channelDescription: 'Reminder notifications',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        enableVibration: true,
        ticker: 'ticker',
        visibility: NotificationVisibility.public,
        icon: '@mipmap/ic_launcher',
      ),
    );
    print("Scheduling notification for $scheduled");
    await _notifications.zonedSchedule(
      reminder.id.hashCode,
      "Reminder",
      reminder.type,
      scheduled,
      details,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents:
      reminder.repeat == 'daily'
          ? DateTimeComponents.time
          : null,
    );
  }
}