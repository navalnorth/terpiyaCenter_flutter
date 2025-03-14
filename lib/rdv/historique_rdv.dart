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

  Stream<List<QueryDocumentSnapshot>> _fetchRdv() {
    String? userId = _auth.currentUser?.uid;
    return FirebaseFirestore.instance.collection('rendezvous').where('userId', isEqualTo: userId).orderBy('timestamp', descending: true).snapshots().map((snapshot) => snapshot.docs);
  }

  Future<void> _cancelRdv(String rdvId) async {
    await FirebaseFirestore.instance.collection('rendezvous').doc(rdvId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des Rendez-vous"),
        backgroundColor: const Color.fromARGB(255, 53, 172, 177),
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: _fetchRdv(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun rendez-vous trouvé.", style: TextStyle(fontSize: 18)));
          }

          List<QueryDocumentSnapshot> rdvList = snapshot.data!.where((rdv) {
            List<String> blockedTimes = List<String>.from(rdv['blockedTimes'] ?? []);
            return blockedTimes.isEmpty || blockedTimes.first == rdv['time']; 
          }).toList();
          DateTime now = DateTime.now();
          DateTime today = DateTime(now.year, now.month, now.day);

          List<QueryDocumentSnapshot> futureRdv = [];
          List<QueryDocumentSnapshot> pastRdv = [];

          for (var rdv in rdvList) {
            DateTime rdvDate = DateTime.parse(rdv['date']);
            if (rdvDate.isAfter(today) || rdvDate.isAtSameMomentAs(today)) {
              futureRdv.add(rdv);
            } else {
              pastRdv.add(rdv);
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                if (futureRdv.isNotEmpty) ...[
                  _buildSectionTitle("📅 Futurs Rendez-vous"),
                  ...futureRdv.map((rdv) => _buildDismissibleRdvCard(rdv)),
                ],
                if (pastRdv.isNotEmpty) ...[
                  _buildSectionTitle("⏳ Rendez-vous Passés"),
                  ...pastRdv.map((rdv) => _buildDismissibleRdvCard(rdv)),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  /// Affiche un titre pour séparer les sections
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 53, 172, 177)),
      ),
    );
  }


   Widget _buildDismissibleRdvCard(QueryDocumentSnapshot rdv) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Dismissible(
        key: Key(rdv.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.delete, color: Colors.white,),
        ),
        confirmDismiss: (direction) async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Annuler le rendez-vous"),
              content: const Text("Êtes-vous sûr d'annuler (Si acompte il y a le remboursement se fait si le RDV est annulé 24h avant la séance) ce rendez-vous ?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Non"),
                ),
                TextButton(
                  onPressed: () {
                    _cancelRdv(rdv.id);
                    Navigator.pop(context, true);
                  },
                  child: const Text("Oui"),
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) async {
          final messenger = ScaffoldMessenger.of(context); // Capture le ScaffoldMessenger avant l'await
          await _cancelRdv(rdv.id);
      
          if (!mounted) return;
          messenger.showSnackBar(
            const SnackBar( content: Text("Rendez-vous supprimé"),duration: Duration(seconds: 2) ),
          );
        },
        child: _buildRdvCard(rdv),
      ),
    );
  }



  /// Construit une carte pour afficher un rendez-vous
  Widget _buildRdvCard(QueryDocumentSnapshot rdv) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(rdv['date']));
    String time = rdv['time'];
    String therapie = rdv['therapie'];
    int duration = rdv['duration'];
    String? imageUrl = (rdv.data() as Map<String, dynamic>).containsKey('imageUrl') ? rdv['imageUrl'] : null;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 53, 172, 177)),
        title: Text("Thérapie : $therapie", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📅 $formattedDate - ⏰ $time - ⏳ $duration min"),
            const Text("👉 Restez appuyé pour voir votre image"),
          ],
        ),
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Votre image de thérapie"),
              content: imageUrl != null
                    ? Image.network(imageUrl, fit: BoxFit.cover,)
                    : const Text("Aucune image disponible."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Fermer"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
