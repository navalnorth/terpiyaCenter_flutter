import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terapiya_center/data/notif_fcm.dart';

class Notifsadmin extends StatefulWidget {
  const Notifsadmin({super.key});

  @override
  State<Notifsadmin> createState() => _NotifsadminState();
}

class _NotifsadminState extends State<Notifsadmin> {
  Stream<QuerySnapshot> _fetchAllNotifs() {
    return FirebaseFirestore.instance.collection('notifs').orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> _deleteRdv(String notifId) async {
    await FirebaseFirestore.instance.collection('notifs').doc(notifId).delete();
  }

  Future<List<String>> getAllDeviceTokens() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('tokens').get();

    return querySnapshot.docs.map((doc) => doc['token'] as String).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fetchAllNotifs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center( child: SpinKitChasingDots( color: Color.fromARGB(255, 53, 172, 177), size: 50 ) );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center( child: Text("Aucune notification trouvée.", style: TextStyle(fontSize: 18)) );
          }

          final notifs = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: notifs.length,
              itemBuilder: (context, index) {
                final notif = notifs[index];
                String notifId = notif.id;

                return Container(
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.brown[200] ?? Colors.brown : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.brown[200] ?? Colors.brown),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),

                  child: Dismissible(
                    key: Key(notifId),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon( Icons.delete, color: Colors.white ),
                    ),

                    onDismissed: (direction) async {
                      final messenger = ScaffoldMessenger.of(context);
                      await _deleteRdv(notifId);

                      if (!mounted) return;
                      messenger.showSnackBar(
                        const SnackBar(content: Text("Notification supprimée"), duration: Duration(seconds: 2)),
                      );
                    },

                    child: ListTile(
                      title: Text(
                        notif['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:index % 2 == 0 ? Colors.white : Colors.black),
                      ),
                      subtitle: Text(
                        notif['subtitle'],
                        style: TextStyle(color: index % 2 == 0 ? Colors.white : Colors.black)
                      ),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController titleController = TextEditingController(text: notif['title']);
                            TextEditingController subtitleController = TextEditingController(text: notif['subtitle']);
                            TextEditingController linkController = TextEditingController(text: notif['link']);

                            return AlertDialog(
                              title: const Text("Modifier la notification"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: titleController,
                                    decoration: const InputDecoration(labelText: "Titre"),
                                  ),

                                  TextField(
                                    controller: subtitleController,
                                    decoration: const InputDecoration(labelText: "Sous-titre"),
                                  ),
                                  TextField(
                                    controller: linkController,
                                    decoration: const InputDecoration(labelText: "Lien"),
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
                                    final navigator = Navigator.of(context);
                                    await FirebaseFirestore.instance.collection('notifs').doc(notif.id).update({'title': titleController.text,'subtitle': subtitleController.text,'link': linkController.text});
                                    
                                    if (!mounted) return;
                                    navigator.pop();
                                  },
                                  child: const Text("Enregistrer"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TextEditingController titleController = TextEditingController();
          TextEditingController subtitleController = TextEditingController();
          TextEditingController linkController = TextEditingController();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Ajouter une notification"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: "Titre"),
                    ),
                    TextField(
                      controller: subtitleController,
                      decoration: const InputDecoration(labelText: "Sous-titre"),
                    ),
                    TextField(
                      controller: linkController,
                      decoration: const InputDecoration(labelText: "Lien"),
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
                      final navigator = Navigator.of(context);
                      String title = titleController.text;
                      String body = subtitleController.text;
                      String link = linkController.text;

                      // 1️⃣ Récupérer tous les tokens
                      List<String> deviceTokens = await getAllDeviceTokens();
                      if (deviceTokens.isEmpty) {
                        if (kDebugMode) {
                          print("❌ Aucun utilisateur n'a de token FCM.");
                        }
                        return;
                      }

                      // 2️⃣ Ajouter la notification à Firestore
                      await FirebaseFirestore.instance.collection('notifs').add({
                        'title': titleController.text,
                        'subtitle': subtitleController.text,
                        'link': linkController.text,
                        'timestamp': FieldValue.serverTimestamp(),
                      });

                      // 3️⃣ Envoyer la notification à tout le monde
                      await sendNotification(title, body, link);

                      navigator.pop();
                    },
                    child: const Text("Enregistrer"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
