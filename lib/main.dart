import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:terapiya_center/accueil/home.dart';
import 'package:terapiya_center/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('fr_FR', null);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  setupFCMListeners();

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
