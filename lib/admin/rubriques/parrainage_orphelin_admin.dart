import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ParrainageOrphelinAdmin extends StatefulWidget {
  const ParrainageOrphelinAdmin({super.key});

  @override
  ParrainageOrphelinAdminState createState() => ParrainageOrphelinAdminState();
}

class ParrainageOrphelinAdminState extends State<ParrainageOrphelinAdmin> {
  final CollectionReference donInfosCollection = FirebaseFirestore.instance.collection('donInfos');
  List<Map<String, dynamic>> filteredDons = [];

  Future<void> fetchDons() async {
    QuerySnapshot snapshot = await donInfosCollection.get();
    List<Map<String, dynamic>> tempList = [];

    for (var doc in snapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      String docId = doc.id;

      String userId = data.containsKey('userId') ? data['userId'] : 'inconnu';

      if (data.containsKey('dons') && data['dons'] is List) {
        for (var don in data['dons']) {
          if (don is Map<String, dynamic>) {
            if (don['nom'] == "parrainage orphelin /an") {
              tempList.add({...don, 'docId': docId, 'userId': userId});
            }
          } else {
            if (kDebugMode) {
              print("⚠️ Don mal formatté : $don");
            }
          }
        }
      }
    }
    setState(() {
      filteredDons = tempList;
    });
  }
  


  Future<Map<String, dynamic>?> getUserInfo(String userId) async {
    if (userId == 'inconnu') return null;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userSnapshot.exists ? userSnapshot.data() as Map<String, dynamic> : null;
  }



  void deleteDon(String docId, Map<String, dynamic> don) async {
    if (docId.isEmpty || !don.containsKey('donId')) return;

    DocumentReference docRef = donInfosCollection.doc(docId);
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      List<dynamic> dons = List.from(docSnapshot['dons'] ?? []);

      // ✅ Supprimer uniquement l'élément avec le donId spécifique
      dons.removeWhere((d) => d['donId'] == don['donId']);

      // ✅ Mettre à jour Firestore avec la nouvelle liste
      await docRef.update({'dons': dons});

      // ✅ Mettre à jour localement la liste
      setState(() {
        filteredDons.removeWhere((d) => d['donId'] == don['donId']);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dons de Parrainage orphelin")),
      body: ListView.builder(
        itemCount: filteredDons.length,
        itemBuilder: (context, index) {
          var don = filteredDons[index];
          String userId = don['userId'];

          if (userId == 'inconnu') {
            return const ListTile(
              title: Text("Utilisateur inconnu"),
              subtitle: Text("Informations manquantes."),
            );
          }

          return FutureBuilder<Map<String, dynamic>?>(
            future: getUserInfo(userId),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return ListTile(
                  title: const Text("Chargement..."),
                  subtitle: Text("Récupération des données pour l'utilisateur $userId"),
                );
              }

              if (!userSnapshot.hasData || userSnapshot.data == null) {
                return ListTile(
                  title: Text("Utilisateur $userId introuvable"),
                  subtitle: const Text("L'utilisateur n'existe plus dans Firestore."),
                );
              }

              var user = userSnapshot.data!;
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text("${user['nom']} ${user['prenom']}"),
                  subtitle: Text(user['email'] ?? 'Pas d\'email'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteDon(don['docId'], don),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
