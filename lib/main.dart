import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:terapiya_center/accueil/home.dart';
import 'package:terapiya_center/data/notif_push.dart';
import 'package:terapiya_center/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('fr_FR', null);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotifPush().initNotifications();

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
