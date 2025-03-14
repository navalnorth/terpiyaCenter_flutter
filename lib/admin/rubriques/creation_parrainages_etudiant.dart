import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

class CreationParrainagesEtudiant extends StatefulWidget {
  const CreationParrainagesEtudiant({super.key});

  @override
  State<CreationParrainagesEtudiant> createState() => _CreationParrainagesEtudiantState();
}

class _CreationParrainagesEtudiantState extends State<CreationParrainagesEtudiant> {
  final ImagePicker _picker = ImagePicker();



  Future<void> _addDonationDialog() async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    List<File> selectedImages = [];

    Future<void> pickImages() async {
      final pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        setState(() {
          selectedImages = pickedFiles.map((file) => File(file.path)).toList();
        });
      }
    }

    Future<void> uploadDonation() async {
      if (titleController.text.isEmpty || messageController.text.isEmpty || selectedImages.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez remplir tous les champs et sélectionner au moins une image.")));
        return;
      }

      try {
        List<String> imageUrls = [];
        for (var image in selectedImages) {
          final storageRef = FirebaseStorage.instance.ref().child("parrainageEtudiant/${DateTime.now().toIso8601String()}-${image.path.split('/').last}");
          await storageRef.putFile(image);
          String imageUrl = await storageRef.getDownloadURL();
          imageUrls.add(imageUrl);
        }

        await FirebaseFirestore.instance.collection("parrainageEtudiant").add({
          "title": titleController.text,
          "message": messageController.text,
          "imageUrls": imageUrls,
          "createdAt": FieldValue.serverTimestamp(),
        });

        if (!mounted) return;
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Message ajouté avec succès !")));
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erreur lors de l'ajout")));
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Ajouter un message pour parrainnées Etudiant"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Titre')),
              const SizedBox(height: 10),
              TextField(controller: messageController, decoration: const InputDecoration(labelText: 'Message'), maxLines: 3),
              const SizedBox(height: 10),
              selectedImages.isNotEmpty ? SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.file(selectedImages[index], height: 100),
                        );
                      },
                    ),
                  )
                : const Text(""),
              TextButton.icon(
                onPressed: pickImages,
                icon: const Icon(Icons.image),
                label: const Text("Choisir des images"),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
            ElevatedButton(onPressed: uploadDonation, child: const Text("Ajouter")),
          ],
        );
      },
    );
  }



  Future<void> _updateDonationDialog(DocumentSnapshot doc) async {
    final TextEditingController titleController = TextEditingController(text: doc["title"]);
    final TextEditingController messageController = TextEditingController(text: doc["message"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Modifier le message"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Annuler"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isEmpty || messageController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez remplir tous les champs.")));
                  return;
                }

                final navigator = Navigator.of(context);
                final messenger = ScaffoldMessenger.of(context);
                try {
                  await FirebaseFirestore.instance.collection("parrainageEtudiant").doc(doc.id).update({
                    "title": titleController.text,
                    "message": messageController.text,
                  });

                  if (!mounted) return;
                  navigator.pop();
                  messenger.showSnackBar(const SnackBar(content: Text("Message mis à jour avec succès !")));
                } catch (e) {
                  if (!mounted) return;
                  messenger.showSnackBar(const SnackBar(content: Text("Erreur lors de la mise à jour")),);
                }
              },
              child: const Text("Mettre à jour"),
            ),
          ],
        );
      },
    );
  }



  Future<void> _deleteDonation(DocumentSnapshot doc) async {
    try {
      List<String> imageUrls = List<String>.from(doc["imageUrls"] ?? []);
      for (String imageUrl in imageUrls) {
        await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      }
      await FirebaseFirestore.instance.collection("parrainageEtudiant").doc(doc.id).delete();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Message supprimé avec succès")));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erreur lors de la suppression}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parrainnées orphelins")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("parrainageEtudiant").orderBy("createdAt", descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Aucun message général disponible."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              List<dynamic> imageUrls = doc["imageUrls"] ?? [];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: SafeArea(
                  child: Column(
                    children: [
                      if (imageUrls.isNotEmpty)
                        CarouselSlider(
                          items: imageUrls.map((url) => Image.network(url, width: double.infinity)).toList(),
                          options: CarouselOptions(height: 200, autoPlay: true),
                        ),
                      ListTile(
                        title: Text(doc["title"] ?? "Sans titre"),
                        subtitle: Text(doc["message"] ?? ""),
                        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => _deleteDonation(doc)),
                        onLongPress: () => _updateDonationDialog(doc),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addDonationDialog, child: const Icon(Icons.add)),
    );
  }
}
