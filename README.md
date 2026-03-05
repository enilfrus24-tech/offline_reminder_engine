Offline Reminder Engine

Reliable offline reminders for Flutter using Android exact alarms.

A lightweight Flutter engine that schedules reminders which fire even when the app is:

• Closed
• Running in the background
• Restarted after device reboot

No internet connection required.

Many reminder implementations fail when apps are killed or devices restart.
This engine uses Android exact alarm scheduling to ensure reminders remain reliable.

---

Features

- Reliable offline reminder scheduling
- Uses Android exact alarm clock scheduling
- Works when the app is closed
- Survives device reboot
- Supports daily repeating reminders
- Simple developer-friendly API

---

Installation

Add the engine to your "pubspec.yaml":

offline_reminder_engine:
  path: ../offline_reminder_engine

---

Basic Usage

Import the engine:

import 'package:offline_reminder_engine/offline_reminder_engine.dart';

Initialize the reminder system when your app starts:

await NotificationService.init();

Create and schedule a reminder:

final reminder = Reminder(
  id: "feed_dog",
  type: "Feed the dog",
  time: DateTime.now().add(Duration(minutes: 10)),
);

await ReminderManager.schedule(reminder);

---

Example Use Cases

- Habit reminder apps
- Medication reminders
- Pet care reminders
- Offline todo apps
- Alarm-style utilities

---

Platform Support

Android ✓
iOS (future support)

---

Support the Project

If this engine saves you development time or helps your project, consider supporting development.

☕ https://buymeacoffee.com/enilfrus

⭐ If this project helps you, consider starring the repository.

---

License

MIT License
