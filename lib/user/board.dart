import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Bonjour user"),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              }, 
              icon: const Icon(Icons.logout),
               color: Color.fromARGB(255, 53, 172, 177),
               iconSize: 30,
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Bienvenue sur Board ! ${currentUser.email!}"),
            ),
          ],
        ),
      ),
    );
  }
}
