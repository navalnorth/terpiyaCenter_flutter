import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatefulWidget {
  final double fontSize;

  const GetUserName({
    super.key,
    this.fontSize=17,
  });

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  Future<DocumentSnapshot?> _fetchUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    return FirebaseFirestore.instance.collection('users').doc(user.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot?>(
      future: _fetchUserData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
          return const Text("⚠️ Vous êtes introuvable !");
        }

        Map<String, dynamic>? data = snapshot.data!.data() as Map<String, dynamic>?;
        if (data == null || !data.containsKey('prenom')) {
          return const Text("⚠️ Champ 'prenom' manquant !");
        }

        return Text(
          "Bonjour, ${data['prenom']} !",
          style: TextStyle(color: Colors.white, fontSize: widget.fontSize),
        );
      },
    );
  }
}
