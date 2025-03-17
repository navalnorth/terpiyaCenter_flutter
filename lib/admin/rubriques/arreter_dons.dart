import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArreterDons extends StatefulWidget {
  const ArreterDons({super.key});

  @override
  State<ArreterDons> createState() => _ArreterDonsState();
}

class _ArreterDonsState extends State<ArreterDons> {
  final CollectionReference donsCollection = FirebaseFirestore.instance.collection('dons');

  void toggleDonStatus(String donId, bool isActive) {
    donsCollection.doc(donId).update({'actif': !isActive});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gérer les dons")),
      body: StreamBuilder<QuerySnapshot>(
        stream: donsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Aucun don disponible."));
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;
              String donId = doc.id;
              String nom = data['nom'] ?? 'Sans nom';
              bool isActive = data['actif'] ?? true;

              return ListTile(
                title: Text(nom),
                trailing: Switch(
                  value: isActive,
                  onChanged: (value) => toggleDonStatus(donId, isActive),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
