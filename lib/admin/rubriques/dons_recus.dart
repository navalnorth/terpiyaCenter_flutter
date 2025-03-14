import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DonsRecus extends StatefulWidget {
  const DonsRecus({super.key});

  @override
  State<DonsRecus> createState() => _DonsRecusState();
}

class _DonsRecusState extends State<DonsRecus> {
  Stream<List<QueryDocumentSnapshot>> _fetchDons() {
    return FirebaseFirestore.instance.collection('donInfos').orderBy('date', descending: true).snapshots().map((snapshot) => snapshot.docs);
  }



  Future<void> _addImagesToFirebase(String donId) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isEmpty) return;

    List<String> imageUrls = [];

    for (XFile file in pickedFiles) {
      File imageFile = File(file.path);
      String fileName = 'dons/$donId/${DateTime.now().millisecondsSinceEpoch}.jpg';

      try {
        UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        if (kDebugMode) {
          print("Erreur lors du téléversement: $e");
        }
      }
    }

    if (imageUrls.isNotEmpty) {
      await FirebaseFirestore.instance.collection('donInfos').doc(donId).update({
        'images': FieldValue.arrayUnion(imageUrls),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des Dons"),
      ),

      body: StreamBuilder<List<QueryDocumentSnapshot>>(
        stream: _fetchDons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun don enregistré.",style: TextStyle(fontSize: 18)));
          }

          List<QueryDocumentSnapshot> donsList = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: donsList.length,
            itemBuilder: (context, index) {
              var don = donsList[index];
              DateTime date = (don['date'] as Timestamp).toDate();
              String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(date);
              List<dynamic> dons = don['dons'];
              String message = don['message'] ?? "Pas de message";

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    List<String> images = [];
                    try {
                      images = List<String>.from(don['images'] ?? []);
                    } catch (e) {
                      if (kDebugMode) {
                        print("Aucune image trouvée : $e");
                      }
                    }

                    if (images.isNotEmpty) {
                      _showImageSlider(context, images);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("📸 Aucune image disponible."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  onLongPress: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    await _addImagesToFirebase(don.id);
                    if (!mounted) return;
                    messenger.showSnackBar(const SnackBar(content: Text("📤 Images ajoutées avec succès !"), duration: Duration(seconds: 2),),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("📅 $formattedDate", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                  
                        ...dons.map((donItem) => Text(
                            "🎁 ${donItem['nom']} - Bénéficiaire: ${donItem['beneficiaire']}",
                            style: const TextStyle(fontSize: 14))),
                        const SizedBox(height: 5),
                        
                        Text("💬 Message: $message",style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                )
              );
            },
          );
        },
      ),
    );
  }
  void _showImageSlider(BuildContext context, List<String> imageUrls) {
    PageController pageController = PageController();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: pageController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(imageUrls[index], fit: BoxFit.cover);
                },
              ),
            ),
            // Flèche gauche
            Positioned(
              left: 10,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  if (pageController.page! > 0) {
                    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), shape: BoxShape.circle ),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                ),
              ),
            ),
            // Flèche droite
            Positioned(
              right: 10,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  if (pageController.page! < imageUrls.length - 1) {
                    pageController.nextPage(duration: const Duration(milliseconds: 300),curve: Curves.easeInOut, );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), shape: BoxShape.circle ),
                  child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                ),
              ),
            ),

            Positioned(
              top: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), shape: BoxShape.circle,),
                constraints: const BoxConstraints(maxWidth: 35, maxHeight: 35),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
