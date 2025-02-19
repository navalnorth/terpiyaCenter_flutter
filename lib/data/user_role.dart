import 'package:cloud_firestore/cloud_firestore.dart';

class UserRole {
  Future<String?> getUserRole(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      return data['role'];
    } else {
      return null;
    }
  }
}