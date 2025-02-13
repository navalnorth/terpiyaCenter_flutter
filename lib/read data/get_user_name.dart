import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    
    if (user == null) {
      return const Text("Utilisateur non connecté");
    }

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(user.uid).get(),
      builder: (context, snapshot) {

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("⚠️ Vous êtes introuvable !");
        }

        Map<String, dynamic>? data = snapshot.data!.data() as Map<String, dynamic>?;
        if (data == null || !data.containsKey('prenom')) {
          return const Text("⚠️ Champ 'prenom' manquant !");
        }

        return Text(
          "Bonjour, ${data['prenom']} !", 
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
