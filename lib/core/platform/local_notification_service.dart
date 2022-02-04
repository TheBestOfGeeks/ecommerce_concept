import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) {
    final id = DateTime
        .now().hour + 1;

    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "firebasenotifications",
          "firebasenotifications channel",
          importance: Importance.max,
          priority: Priority.high,
        ));

    _notificationsPlugin.show(
        id, message.notification!.title, message.notification!.title,
        notificationDetails);
  }

}
