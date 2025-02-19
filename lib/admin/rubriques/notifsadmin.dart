// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:intl/intl.dart';

// class Notifsadmin extends StatefulWidget {
//   const Notifsadmin({super.key});

//   @override
//   State<Notifsadmin> createState() => _NotifsadminState();
// }

// class _NotifsadminState extends State<Notifsadmin> {

//   Stream<QuerySnapshot> _fetchAllRdv() {
//     return FirebaseFirestore.instance.collection('rendezvous').where('gender', isEqualTo: 'Homme').orderBy('timestamp', descending: true).snapshots();
//   }

//   Stream<QuerySnapshot> _fetchUser() {
//     return FirebaseFirestore.instance.collection('users').where('gender', isEqualTo: 'Homme').snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Notifications"),
//         centerTitle: true,
//       ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: _fetchAllRdv(), 
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50,),);
//           }

//           if (!snapshot.hasData && snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text("Aucun rendez-vous trouvé.", style: TextStyle(fontSize: 18)),
//             );
//           }

//           var rdvList = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: rdvList.length,
//             itemBuilder: (context, index) {
//               var rdv = rdvList[index];
//               String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(rdv['date']));
//               String time = rdv['time'];
//               String therapie = rdv['herapie'];

//               return Card(
//                 margin:  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 child: ListTile(
//                   leading: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 53, 172, 177),),
//                   title: Text("Thérapie: $therapie", style: const TextStyle(fontWeight: FontWeight.bold),),
//                   subtitle: Text("📅 $formattedDate - ⏰ $time"),
//                 ),
//               );
//             }
//           );
//         }
//       ),
//     );
//   }
// }