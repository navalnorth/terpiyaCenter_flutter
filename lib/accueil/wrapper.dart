import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terapiya_center/admin/boardadmin.dart';
import 'package:terapiya_center/auth/login.dart';
import 'package:terapiya_center/data/user_role.dart';
import 'package:terapiya_center/user/board.dart';

class Wrapper extends StatelessWidget {
  Wrapper({super.key});

  final UserRole userRole = UserRole();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
          
            return FutureBuilder(
              future: userRole.getUserRole(user.uid), 
              builder: (context, roleSnapshot) {
                if (roleSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (roleSnapshot.hasData && roleSnapshot.data == 'admin') {
                  return const Boardadmin();
                } else {
                  return const Board();
                }
              }
            );
          } else {
            return const Login();
          }
        }
      ),
    );
  }
}