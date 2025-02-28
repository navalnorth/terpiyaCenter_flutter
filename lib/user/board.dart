import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terapiya_center/composants/notifications_dialog.dart';
import 'package:terapiya_center/composants/rubrique_board.dart';
import 'package:terapiya_center/rdv/historique_rdv.dart';
import 'package:terapiya_center/data/get_user_name.dart';
import 'package:terapiya_center/rubriques/auriculotherapie.dart';
import 'package:terapiya_center/rubriques/contact.dart';
import 'package:terapiya_center/rubriques/detatouage.dart';
import 'package:terapiya_center/rubriques/formations/formations_home.dart';
import 'package:terapiya_center/rubriques/hijama.dart';
import 'package:terapiya_center/rubriques/humanitaire.dart';
import 'package:terapiya_center/rubriques/voyage.dart';

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
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          automaticallyImplyLeading: false,
          title: const GetUserName(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              NotificationsDialog.show(context);
            },
            icon: const Icon(Icons.email),
            color: Colors.white,
            iconSize: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
              color: Colors.white,
              iconSize: 30,
            )
          ],
        ),

        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Hijama",
                      destination: Hijama(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Auriculothérapie",
                      destination: Auriculotherapie(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Détatouage",
                      destination: Detatouage(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Formations",
                      destination: FormationsHome(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Dons Humanitaires",
                      destination: Humanitaire(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Voyages Humanitaires",
                      destination: Voyage(),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Historique\n des RDV",
                      destination: HistoriqueRdv(),
                    ),
                    SizedBox(width: 30),

                    RubriqueBoard(
                      text: "Suivi des\n dons généraux",
                      destination: Hijama(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Suivi des\n dons personnels",
                      destination: Hijama(),
                    ),
                    SizedBox(width: 30),

                    RubriqueBoard(
                      text: "Contact",
                      destination: Contact(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
