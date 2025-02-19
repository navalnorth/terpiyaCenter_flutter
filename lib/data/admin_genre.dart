import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminGenre {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Récupérer le genre de l'admin connecté
  Future<String?> getAdminGenre() async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) return null;

    DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
    if (userDoc.exists && userDoc.data() != null) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      return data['genreAdmin'];
    }
    return null;
  }
}
