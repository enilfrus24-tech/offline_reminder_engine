Offline Reminder Engine

Reliable offline reminders for Flutter using Android exact alarms.

A lightweight Flutter engine for scheduling reminders that fire even when the app is:

- Closed
- In the background
- After device reboot

No internet connection required.

---

Features

- Offline reminder scheduling
- Android alarm-clock level reliability
- Works when the app is closed
- Survives device reboot
- Daily repeating reminders
- Simple API for developers

---

Installation

Add the package to your "pubspec.yaml":

offline_reminder_engine:
  path: ../offline_reminder_engine

---

Basic Usage

Import the engine:

import 'package:offline_reminder_engine/offline_reminder_engine.dart';

Initialize notifications on app start:

await NotificationService.init();

Schedule a reminder:

final reminder = Reminder(
  id: "test",
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
- Alarm style utilities

---

Platform Support

Android ✓
iOS (future support)

---

License

MIT License
