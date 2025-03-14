import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/rubriques/parrainage/etudiants_parrainage.dart';
import 'package:terapiya_center/rubriques/parrainage/orphelin_parrainage.dart';

class EspaceParainage extends StatefulWidget {
  const EspaceParainage({super.key});

  @override
  State<EspaceParainage> createState() => _EspaceParainageState();
}

class _EspaceParainageState extends State<EspaceParainage> {
  Future<bool> hasDonatedOrphelin(String userId) async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection("donInfos").where("userId", isEqualTo: userId).get();

    if (snapshot.docs.isEmpty) return false;

    for (var doc in snapshot.docs) {
      List<dynamic>? dons = doc.data()["dons"];
      if (dons != null && dons.any((don) => don["nom"] == "parrainage orphelin /an")) {
        return true;
      }
    }

    return false;
  } catch (e) {
    if (kDebugMode) {
      print("❌ Erreur Firestore: $e");
    }
    return false;
  }
}


  Future<bool> hasDonatedEtudiant(String userId) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance.collection("donInfos").where("userId", isEqualTo: userId).get();

    if (querySnapshot.docs.isEmpty) return false;

    for (var doc in querySnapshot.docs) {
      List<dynamic>? dons = doc.data()["dons"];
      if (dons != null && dons.any((don) => don["nom"] == "parrainage etudiant /an")) {
        return true;
      }
    }

    return false;
  } catch (e) {
    if (kDebugMode) {
      print("❌ Erreur Firestore: $e");
    }
    return false;
  }
}






  void _showAccessDeniedDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Accès refusé"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }



  Future<void> _handleEtudiantAccess() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    bool hasAccess = await hasDonatedEtudiant(userId);

    if (!mounted) return;
    if (hasAccess) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const EtudiantsParrainage()));
    } else {
      _showAccessDeniedDialog("Vous devez parrainer un étudiant pour accéder à cette section.");
    }
  }

  Future<void> _handleOrphelinAccess() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    bool hasAccess = await hasDonatedOrphelin(userId);

    if (!mounted) return;
    if (hasAccess) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const OrphelinParrainage()));
    } else {
      _showAccessDeniedDialog("Vous devez parrainer un orphelin pour accéder à cette section.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 172, 177),
        title: const Text("Espace Parrainages", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text(
                "Parrainez un orphelin ou un étudiant pour accéder à cet espace !",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              GestureDetector(
                onTap: _handleEtudiantAccess,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 53, 172, 177),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Étudiants",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              GestureDetector(
                onTap: _handleOrphelinAccess,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 53, 172, 177),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Orphelins",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Text(
                "Pour plus d'infos contactez-nous sur WhatsApp !",
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
