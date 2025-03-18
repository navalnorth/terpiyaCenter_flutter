import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DeductionFiscale extends StatefulWidget {
  const DeductionFiscale({super.key});

  @override
  State<DeductionFiscale> createState() => _DeductionFiscaleState();
}

class _DeductionFiscaleState extends State<DeductionFiscale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tous les Dons"), centerTitle: true),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("donInfos").orderBy("date", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Aucun don enregistré."));
          }

          var dons = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: dons.length,
            itemBuilder: (context, index) {
              var don = dons[index].data();
              DateTime date = (don["date"] as Timestamp).toDate();
              String dateStr = DateFormat('dd/MM/yyyy HH:mm').format(date);
              List<dynamic> donDetails = don["dons"];

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  title: Text(
                    "${don["nom"]} ${don["prenom"]} - ${don["total"]}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Don du $dateStr - ${don["mode_paiement"]}"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (don.containsKey("paypalEmail")) _buildInfoRow("💰 PayPal Email", don["paypalEmail"]),
                          _buildInfoRow("📍 Adresse", don["adresse"]),
                          _buildInfoRow("🏙 Commune", don["commune"]),
                          _buildInfoRow("📮 Code Postal", don["cp"]),
                          _buildInfoRow("🔥 Pays", don["pays"]),
                          _buildInfoRow("📧 Email", don["email"]),
                          _buildInfoRow("📞 Téléphone", don["telephone"]),
                          _buildInfoRow("📝 Message", don["message"]),

                          const Divider(thickness: 2),

                          // 📌 Liste des dons :
                          const Text("📦 Détails des Dons :", style: TextStyle(fontWeight: FontWeight.bold)),
                          ...donDetails.map((donInfo) {
                            return ListTile(
                              title: Text("🎁 ${donInfo["nom"]}"),
                              subtitle: Text("Bénéficiaire : ${donInfo["beneficiaire"]}"),
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // 📌 Fonction pour afficher une ligne d'information
  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text("$label :", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 5),
          Expanded(child: Text(value ?? "Non renseigné", style: const TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}
