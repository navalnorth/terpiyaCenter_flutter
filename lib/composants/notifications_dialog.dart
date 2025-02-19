import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationsDialog extends StatefulWidget {
  const NotificationsDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const NotificationsDialog();
      },
    );
  }

  @override
  NotificationsDialogState createState() => NotificationsDialogState();
}

class NotificationsDialogState extends State<NotificationsDialog> {
  void _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text("Il n'y a pas de lien"))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // En-tête
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),

            // Liste des notifications depuis Firestore
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('notifs').orderBy('timestamp', descending: true).limit(10).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177),size: 50));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("Aucune notification",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                    );
                  }

                  // Construire la liste des notifications avec alternance de couleurs
                  final notifs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: notifs.length,
                    itemBuilder: (context, index) {
                      final notif = notifs[index];

                      return Container(
                        decoration: BoxDecoration(
                          color: index % 2 == 0 ? const Color.fromARGB(255, 53, 172, 177) : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color.fromARGB(255, 53, 172, 177))
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        
                        child: ListTile(
                          title: Text(
                            notif['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: index % 2 == 0 ? Colors.white : Colors.black
                            ),
                          ),
                          subtitle: Text(
                            notif['subtitle'], 
                            style: TextStyle(
                              color: index % 2 == 0 ? Colors.white : Colors.black
                            )
                          ),
                          onTap: () => _openLink(notif['link']),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
