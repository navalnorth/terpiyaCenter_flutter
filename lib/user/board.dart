import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terapiya_center/composants/notifications_dialog.dart';
import 'package:terapiya_center/composants/rubrique_board.dart';
import 'package:terapiya_center/rdv/historique_rdv.dart';
import 'package:terapiya_center/data/get_user_name.dart';
import 'package:terapiya_center/rubriques/contact.dart';
import 'package:terapiya_center/rubriques/formations/formations_home.dart';
import 'package:terapiya_center/rubriques/hommes/hijama_homme.dart';
import 'package:terapiya_center/rubriques/humanitaire.dart';
import 'package:terapiya_center/rubriques/hommes/espace_hommes.dart';
import 'package:terapiya_center/rubriques/femmes/espace_femmes.dart';

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

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RubriqueBoard(
                        text: "Espace Hommes",
                        bgcolor: Colors.blue.shade400,
                        destination: const EspaceHommes(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RubriqueBoard(
                        text: "Espace Femmes",
                        bgcolor: Colors.pink.shade400,
                        destination: const EspaceFemmes(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Formations",
                      destination: FormationsHome(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Dons Humanitaires",
                      destination: Humanitaire(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                const Row(
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
                      destination: HijamaHomme(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Suivi des\n dons personnels",
                      destination: HijamaHomme(),
                    ),
                    SizedBox(width: 30),

                    RubriqueBoard(
                      text: "Contact",
                      destination: Contact(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
