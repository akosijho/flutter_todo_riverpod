import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/features/auth/pages/notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  final WidgetRef? ref;

  NotificationHelper({this.ref});

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  String? selectedNotificationPayload;

  final BehaviorSubject<String?> selectedNotificationSubject = BehaviorSubject<String?>();

  // @pragma('vm:entry-point')
  Future<void> initializwNotification() async {
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestCriticalPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('task');
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings, iOS: initializationSettingsIOS);

    _configureSelectNotificationSubject();
    await configureLocalTimeZone();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: (data) async {
      if (data != null) {
        debugPrint("notification payload");
      }
      selectedNotificationSubject.add(data.payload);
    });
  }

  requrestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          sound: true,
          badge: true,
        );
  }

  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(AppConstants.defaultTimezone));
  }

  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    showDialog(
        context: ref!.context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title ?? ""),
              content: Text(body ?? ""),
              actions: [
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close")),
                CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("View")),
              ],
            ));
  }

  scheduledNotification(int days, int hours, int minutes, int seconds, Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id ?? 0,
        task.title,
        task.description,
        tz.TZDateTime.now(tz.local).add(Duration(days: days, hours: hours, minutes: minutes, seconds: seconds)),
        const NotificationDetails(android: AndroidNotificationDetails("task", "taskName")),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "${task.title}|${task.description}|${task.date}|${task.startTime}|${task.endTime}");
  }

  _configureSelectNotificationSubject() {
    selectedNotificationSubject.stream.listen((String? paylaad) async {
      var title = paylaad!.split('|')[0];
      var body = paylaad.split('|')[1];
      showDialog(
          context: ref!.context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(title ?? ""),
                content: Text(body ?? ""),
                actions: [
                  CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close")),
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Notifications(payload: paylaad);
                        }));
                      },
                      child: const Text("View")),
                ],
              ));
    });
  }
}
