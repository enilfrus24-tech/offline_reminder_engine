# Reliable Offline Reminders for Flutter

A lightweight Flutter engine for scheduling **reliable offline reminders** that trigger even when:

- The app is closed
- The app is in the background
- The device restarts

Uses Android exact alarms to ensure deterministic scheduling without relying on background workers.

---

## Demo

Reminder firing on a real Android device even when the app is closed.

![Reminder Demo](Screenshot_20260305_081706_One%20UI%20Home.jpg)

---

## Why this exists

Many Flutter reminder implementations rely on timers or background workers that stop working when the OS kills the app.

This engine schedules reminders using the Android alarm system so notifications trigger reliably even if the application is not running.

---

## Features

✓ Offline reminder scheduling  
✓ Android alarm-clock level reliability  
✓ Works when the app is closed  
✓ Survives device reboot  
✓ Daily repeating reminders  
✓ Lightweight and simple API  
✓ Designed for reminder-style apps  

---

## Installation

Add the engine to your `pubspec.yaml`:

```yaml
offline_reminder_engine:
  path: ../offline_reminder_engine
```

---

## Basic Usage

Import the engine:

```dart
import 'package:offline_reminder_engine/offline_reminder_engine.dart';
```

Initialize notifications on app start:

```dart
await NotificationService.init();
```

Create a reminder:

```dart
final reminder = Reminder(
  id: "test",
  type: "Feed the dog",
  time: DateTime.now().add(Duration(minutes: 10)),
);
```

Schedule the reminder:

```dart
await ReminderManager.schedule(reminder);
```

---

## Example Use Cases

- Habit reminder apps
- Medication reminders
- Pet care reminders
- Offline todo apps
- Alarm style utilities

---

## Repository

https://github.com/enilfrus24-tech/offline_reminder_engine

---

## Support the project

If this project is useful to you and you'd like to support development:

https://buymeacoffee.com/enilfrus

---

## License

MIT License
