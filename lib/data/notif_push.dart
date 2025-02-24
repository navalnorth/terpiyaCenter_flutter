import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotifPush {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    // Initialiser les notifications locales
    const AndroidInitializationSettings androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = InitializationSettings(android: androidInitSettings);
    await _localNotifications.initialize(initSettings);

    // Gérer les notifications en premier plan
    FirebaseMessaging.onMessage.listen((RemoteMessage message) { _showLocalNotification(message); });

    // Gérer les notifications en arrière-plan
    FirebaseMessaging.onBackgroundMessage;
  }

  // Affichage d’une notification locale
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id', 
      'channel_name', 
      importance: Importance.high, 
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0, // ID de la notif
      message.notification?.title ?? "Titre",
      message.notification?.body ?? "Contenu",
      notificationDetails,
    );
  }
}
