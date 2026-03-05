import 'package:flutter/material.dart';
import 'package:offline_reminder_engine/offline_reminder_engine.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_intent_plus/android_intent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification engine
  await ReminderManager.initialize();
  // Request Android notification permission
  await requestNotificationPermission();

  // Request exact alarm permission (required for release builds)
  await requestExactAlarmPermission();

  runApp(const DemoApp());
}

Future<void> requestNotificationPermission() async {

  final plugin = FlutterLocalNotificationsPlugin();

  final android =
  plugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>();

  await android?.requestNotificationsPermission();

  // Request exact alarm permission (Android 13+)
  await android?.requestExactAlarmsPermission();
}

Future<void> requestExactAlarmPermission() async {

  const intent = AndroidIntent(
    action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
    data: 'package:com.example.example',
  );

  await intent.launch();

}
class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemoHome(),
    );
  }
}

class DemoHome extends StatelessWidget {
  const DemoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offline Reminder Engine Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: const Text("Schedule Reminder (10s)"),
              onPressed: () async {

                final reminder = Reminder(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  type: "10 Second Reminder",
                  time: DateTime.now().add(const Duration(seconds: 10)),
                );

                await ReminderManager.schedule(reminder);

                print("Reminder scheduled for ${reminder.time}");
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Schedule Reminder (3 minutes)"),
              onPressed: () async {

                final reminder = Reminder(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  type: "3 Minute Reboot Test",
                  time: DateTime.now().add(const Duration(minutes: 3)),
                );

                await ReminderManager.schedule(reminder);

                print("Reminder scheduled for ${reminder.time}");
              },
            ),
            ElevatedButton(
              child: const Text("Request Exact Alarm Permission"),
              onPressed: () async {
                final plugin = FlutterLocalNotificationsPlugin();

                final android =
                plugin.resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>();

                await android?.requestExactAlarmsPermission();
              },
            ),          ],
        ),
      ),
    );
  }
}