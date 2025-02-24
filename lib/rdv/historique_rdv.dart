import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class HistoriqueRdv extends StatefulWidget {
  const HistoriqueRdv({super.key});

  @override
  State<HistoriqueRdv> createState() => _HistoriqueRdvState();
}

class _HistoriqueRdvState extends State<HistoriqueRdv> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Récupère les rendez-vous de l'utilisateur connecté
  Stream<QuerySnapshot> _fetchRdv() {
    String? userId = _auth.currentUser?.uid;
    return FirebaseFirestore.instance.collection('rendezvous').where('userId', isEqualTo: userId).orderBy('timestamp', descending: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des Rendez-vous"),
        backgroundColor: const Color.fromARGB(255, 53, 172, 177),
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: _fetchRdv(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50,));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Aucun rendez-vous trouvé.", style: TextStyle(fontSize: 18)),
            );
          }

          var rdvList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: rdvList.length,
            itemBuilder: (context, index) {
              var rdv = rdvList[index];
              String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(rdv['date']));
              String time = rdv['time'];
              String therapie = rdv['therapie'];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  leading: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 53, 172, 177)),
                  title: Text("Thérapie : $therapie", style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("📅 $formattedDate - ⏰ $time"),
                      const Text("👉 Restez appuyez pour voir votre image")
                    ],
                  ),
                  onLongPress: () {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: const Text("Votre image de thérapie"),
                        content: Image.asset("assets/therapie.jpg"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context), 
                            child: const Text("Fermer")
                          )
                        ],
                      )
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
