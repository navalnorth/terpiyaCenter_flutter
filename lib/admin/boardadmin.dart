import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terapiya_center/admin/rubriques/mes_rdv.dart';
import 'package:terapiya_center/composants/rubrique_bard.dart';
import 'package:terapiya_center/data/get_user_name.dart';
import 'package:terapiya_center/rubriques/detatouage.dart';
import 'package:terapiya_center/rubriques/formations/formations_home.dart';
import 'package:terapiya_center/rubriques/hijama.dart';
// import 'package:terapiya_center/rubriques/humanitaire.dart';
// import 'package:terapiya_center/rubriques/voyage.dart';
// import 'package:terapiya_center/rdv/historique_rdv.dart';
// import 'package:terapiya_center/rubriques/contact.dart';

class Boardadmin extends StatefulWidget {
  const Boardadmin({super.key});

  @override
  State<Boardadmin> createState() => _BoardadminState();
}

class _BoardadminState extends State<Boardadmin> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          automaticallyImplyLeading: false,
          title: const GetUserName(txtcolor: Colors.black,),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
              color: Colors.black,
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
                      text: "Notifications",bgcolor: Colors.amber,
                      textcolor: Colors.black,
                      destination: Hijama(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Mes RDV",
                      bgcolor: Colors.amber,
                      textcolor: Colors.black,
                      destination: MesRdv(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Changer chiffres Humantaire",
                      bgcolor: Colors.amber,
                      textcolor: Colors.black,
                      destination: Detatouage(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Dons reçus",
                      bgcolor: Colors.amber,
                      textcolor: Colors.black,
                      destination: FormationsHome(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     RubriqueBoard(
                //       text: "Actions Humanitaires",
                //       bgcolor: Colors.amberAccent,
                //       textcolor: Colors.black,
                //       destination: Humanitaire(),
                //     ),
                //     SizedBox(width: 30),
                //     RubriqueBoard(
                //       text: "Voyages Humanitaires",
                //       bgcolor: Colors.amberAccent,
                //       textcolor: Colors.black,
                //       destination: Voyage(),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 30),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     RubriqueBoard(
                //       text: "Historique\n des RDV",
                //       bgcolor: Colors.amberAccent,
                //       textcolor: Colors.black,
                //       destination: HistoriqueRdv(),
                //     ),
                //     SizedBox(width: 30),

                //     RubriqueBoard(
                //       text: "Suivi des\n dons généraux",
                //       bgcolor: Colors.amberAccent,
                //       textcolor: Colors.black,
                //       destination: Hijama(),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     RubriqueBoard(
                //       text: "Suivi des\n dons personnels",
                //       bgcolor: Colors.amberAccent,
                //       textcolor: Colors.black,
                //       destination: Hijama(),
                //     ),
                //     SizedBox(width: 30),

                //     RubriqueBoard(
                //       text: "Contact",
                //       bgcolor: Colors.amberAccent,
                //       textcolor: Colors.black,
                //       destination: Contact(),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
