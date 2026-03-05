Offline Reminder Engine

Reliable Flutter offline notifications and reminders using Android exact alarms.

This project solves a common Flutter problem: scheduling notifications that still fire when the app is closed, running in the background, or after a device reboot.

Many reminder implementations rely on background workers which can be delayed or killed by OEM battery optimizations (Xiaomi, Oppo, etc).
This engine avoids that problem by scheduling notifications directly through Android’s alarm system.

No internet connection required.

---

Features

✓ Reliable offline reminder scheduling
✓ Uses Android alarm system for triggering notifications
✓ Works when the app is closed
✓ Survives device reboot
✓ Supports repeating reminders (daily)
✓ Lightweight and simple API
✓ Designed for reminder-style apps

---

Installation

Add the engine to your "pubspec.yaml":

offline_reminder_engine:
  path: ../offline_reminder_engine

---

Basic Usage

Import the engine:

import 'package:offline_reminder_engine/offline_reminder_engine.dart';

Initialize notifications when your app starts:

await NotificationService.init();

Create and schedule a reminder:

final reminder = Reminder(
  id: "feed_dog",
  type: "Feed the dog",
  time: DateTime.now().add(Duration(minutes: 10)),
);

await ReminderManager.schedule(reminder);

---

How It Works

Instead of relying on background execution, reminders are scheduled using Android’s native alarm system.

The engine uses:

- "flutter_local_notifications"
- "zonedSchedule"
- device timezone handling
- exact alarm permissions
- alarm rescheduling after reboot

This allows reminders to fire even if the app is not running.

---

Example Use Cases

• Habit reminder apps
• Medication reminder apps
• Pet care reminders
• Offline todo apps
• Alarm-style utilities
• Personal productivity apps

---

Platform Support

Android ✓
iOS (future support)

---

Support the Project

If this engine saves you development time or helps your project, consider supporting development.

☕ Buy me a coffee:
https://buymeacoffee.com/enilfrus

Even a small donation helps support further development and improvements.

---

License

MIT License
