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
## Demo

Reminder firing on a real Android device even when the app is closed.

![Reminder Demo](Screenshot_20260305_081706_One%20UI%20Home.jpg)


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
Offline Reminder Engine

A lightweight Flutter engine for scheduling reliable offline reminders that fire even when the app is:

• Closed
• In the background
• After device reboot

No internet connection required.

---

Demo

Reminder firing on a real Android device even when the app is closed.

"Reminder Demo" (https://raw.githubusercontent.com/enilfrus24-tech/offline_reminder_engine/main/Screenshot_20260305_081706_One%20UI%20Home.jpg)

---

Features

✓ Offline reminder scheduling
✓ Android alarm-clock level reliability
✓ Works when the app is closed
✓ Survives device reboot
✓ Daily repeating reminders
✓ Lightweight simple API
✓ Designed for reminder-style apps

---

Installation

Add the engine to your "pubspec.yaml":

offline_reminder_engine:
path: ../offline_reminder_engine

Then run:

flutter pub get

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

• Habit reminder apps
• Medication reminders
• Pet care reminders
• Offline todo apps
• Alarm style utilities

---

Platform Support

Android ✓
iOS (future support)

---

Support the Project

If this project helps you, consider supporting development.

Buy me a coffee:
https://buymeacoffee.com/enilfrus

---

License

MIT License
