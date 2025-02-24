import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:terapiya_center/data/admin_genre.dart';

class MesRdv extends StatefulWidget {
  const MesRdv({super.key});

  @override
  State<MesRdv> createState() => _MesRdvState();
}

class _MesRdvState extends State<MesRdv> {
  final AdminGenre _getAdminGenre = AdminGenre();

  // Fonction pour récupérer le stream des rendez-vous en fonction du genre
  Stream<QuerySnapshot> _fetchRdvByGenre(String genre) {
    return FirebaseFirestore.instance.collection('rendezvous').where('gender', isEqualTo: genre).orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> _deleteRdv(String rdvId) async {
    await FirebaseFirestore.instance.collection('rendezvous').doc(rdvId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Rendez-vous"),
        centerTitle: true,
      ),

      body: FutureBuilder<String?>(
        future: _getAdminGenre.getAdminGenre(), // Récupère le genre de l'admin
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Erreur : Impossible de récupérer le genre."));
          }

          String adminGenre = snapshot.data!;

          return StreamBuilder<QuerySnapshot>(
            stream: _fetchRdvByGenre(adminGenre), // Utilise la bonne fonction
            builder: (context, rdvSnapshot) {
              if (rdvSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50));
              }

              if (!rdvSnapshot.hasData || rdvSnapshot.data!.docs.isEmpty) {
                return const Center(child: Text("Aucun rendez-vous trouvé."));
              }

              var rdvList = rdvSnapshot.data!.docs;

              return ListView.builder(
                itemCount: rdvList.length,
                itemBuilder: (context, index) {
                  var rdv = rdvList[index];
                  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(rdv['date']));
                  String time = rdv['time'];
                  String therapie = rdv['therapie'];
                  String rdvId = rdv.id;

                  return Dismissible(
                    key: Key(rdvId),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white,),
                    ),
                    onDismissed: (direction) async {
                      final messenger = ScaffoldMessenger.of(context); // Capture le ScaffoldMessenger avant l'await
                      await _deleteRdv(rdvId);

                      if (!mounted) return;
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text("Rendez-vous supprimé"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 53, 172, 177)),
                        title: Text("Thérapie: $therapie", style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("📅 $formattedDate - ⏰ $time"),
                      ),
                    ),
                  );
                }
              );
            },
          );
        },
      ),
    );
  }
}
