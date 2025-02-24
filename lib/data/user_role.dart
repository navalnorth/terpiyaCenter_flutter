import 'package:cloud_firestore/cloud_firestore.dart';

class UserRole {
  Future<String?> getUserRole(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

      // Si le rôle existe, le renvoyer, sinon renvoyer 'user' par défaut
      return data['role'] ?? 'user'; 
    } else {
      // Si l'utilisateur n'existe pas, renvoyer 'user' par défaut
      return 'user';
    }
  }
}
