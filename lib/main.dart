import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:terapiya_center/accueil/home.dart';
import 'package:terapiya_center/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = 'pk_test_51QyCsNQMSOn7RDTstIvoBzgrs3deL2sC5eXHyVBQMJxFRQCqCEe6ivaMFHgPGVFD1x7Uu70Atpy5mHFrRXsyn5ib00AOlDtyw6';

  await initializeDateFormatting('fr_FR', null);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);

  setupFCMListeners();
  requestPermission();

  runApp(const MyApp());
}


void setupFCMListeners() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.data.containsKey('link')) {
      String link = message.data['link'];
      _openLink(link);
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.data.containsKey('link')) {
      String link = message.data['link'];
      _openLink(link);
    }
  });
}

void _openLink(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Impossible d'ouvrir le lien: $url");
  }
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<void> _firebaseMessagingForegroundHandler(RemoteMessage message) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'channel_ID', 
        'channel_NAME',
        importance: Importance.max, 
        priority: Priority.high, 
        showWhen: false,
        largeIcon: DrawableResourceAndroidBitmap('notif_icon'),
        icon: '@drawable/notif_icon'
      );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  String title = message.notification?.title ?? message.data['title'] ?? "Nouvelle notification";
  String body = message.notification?.body ?? message.data['body'] ?? "Vous avez une nouvelle notification";

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
