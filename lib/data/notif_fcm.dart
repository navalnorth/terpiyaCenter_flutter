import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<String>> getAllDeviceTokens() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('tokens').get();
  return querySnapshot.docs.map((doc) => doc['token'] as String).toList();
}

Future<void> sendNotification(String title, String body, String link) async {
  const url = "https://sendnotification-hkzyphvo7q-uc.a.run.app";

  List<String> tokens = await getAllDeviceTokens();

  if (tokens.isEmpty) {
    if (kDebugMode) {
      print("❌ Aucun token disponible !");
    }
    return;
  }

  final payload = {
    "tokens": tokens,
    "title": title,
    "body": body,
    "link": link,
    "image": "https://i0.wp.com/www.terapiyacenter.com/wp-content/uploads/2023/01/cropped-Terapiya-Center-1.png?resize=150%2C150&ssl=1"
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(payload),
  );
  
  if (kDebugMode) {
    print("🔔 Payload envoyé : ${jsonEncode({ 'tokens': tokens, 'title': title, 'body': body, "link": link })}");
  }


  if (response.statusCode == 200) {
    if (kDebugMode) {
      print("✅ Notification envoyée !");
    }
  } else {
    if (kDebugMode) {
      print("❌ Erreur : ${response.body}");
    }
  }
}
