import '../models/reminder.dart';
import 'notification_service.dart';

class ReminderManager {

  /// Initialize reminder engine
  static Future<void> initialize() async {
    await NotificationService.init();
  }

  /// Schedule reminder
  static Future<void> schedule(Reminder reminder) async {

    if (!reminder.enabled) return;

    await NotificationService.scheduleReminder(
      reminder,
    );
  }

  /// Cancel reminder
  static Future<void> cancel(Reminder reminder) async {

    await NotificationService.cancelReminder(
      reminder,
    );
  }

  /// Rebuild all reminders on app start
  static Future<void> rebuildAll(
      List<Reminder> reminders,
      ) async {

    await NotificationService.cancelAll();

    for (final reminder in reminders) {

      if (!reminder.enabled) continue;

      await NotificationService.scheduleReminder(
        reminder,
      );
    }
  }
}