import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'ImportAll.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestNotificationPermissions() async {
  final bool? granted = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  if (granted == true) {
    print("Notification permissions granted.");
  } else {
    print("Notification permissions denied.");
  }
}

Future<void> initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print('Notification Clicked!');
      AuthWrapper();
    },
    // onDidReceiveBackgroundNotificationResponse: (NotificationResponse response) {
    //   print('Background Notification Clicked!');
    // },
  );
}

Future<void> scheduleDailyNotification() async {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  final tz.TZDateTime scheduledTime = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    15,
    45,
  );

  final tz.TZDateTime adjustedScheduledTime = scheduledTime.isBefore(now)
      ? scheduledTime.add(Duration(days: 1))
      : scheduledTime;

  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'MoneyMate',
    'Daily Reminder',
    channelDescription: 'Daily notifications at a fixed time',
    importance: Importance.high,
    priority: Priority.high,
    color: Color(0xFF42A5F5),
    // Custom notification color
    playSound: true,
    enableLights: true,
    enableVibration: true,
    visibility: NotificationVisibility.public,
    // Make it visible on the lock screen
    timeoutAfter: 10000,
    // Timeout after 10 seconds
    actions: <AndroidNotificationAction>[
      AndroidNotificationAction(
        'action_id_1',
        'Mark as Done', // Action button to mark as done
      ),
      AndroidNotificationAction(
        'action_id_2',
        'Dismiss', // Action button to dismiss
      ),
    ],
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'MoneyMate',
    'This is your daily reminder at 11 PM.',
    adjustedScheduledTime,
    notificationDetails,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}
