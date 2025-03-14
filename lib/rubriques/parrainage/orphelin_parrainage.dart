import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrphelinParrainage extends StatelessWidget {
  const OrphelinParrainage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pour les parraineurs d'orphelins")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("parrainageOrphelin").orderBy("createdAt", descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50);
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
                child: Column(
                  children: [
                    if (imageUrls.isNotEmpty)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                            items: imageUrls.map((url) => Image.network(url, width: double.infinity)).toList(),
                            options: CarouselOptions(height: 200, autoPlay: true),
                          ),
                          const Positioned(left: 10, child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 30)),
                          const Positioned(right: 10, child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 30)),
                        ],
                      ),
                    ListTile(
                      title: Text(doc["title"] ?? "Sans titre"),
                      subtitle: Text(doc["message"] ?? ""),
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
}
