import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/rubrique_board.dart';
import 'package:terapiya_center/rubriques/femmes/auriculotherapie_femme.dart';
import 'package:terapiya_center/rubriques/femmes/detatouage_femme.dart';
import 'package:terapiya_center/rubriques/femmes/hijama_femme.dart';
import 'package:terapiya_center/rubriques/femmes/microneedling.dart';
import 'package:terapiya_center/rubriques/femmes/hydrafacial.dart';
import 'package:terapiya_center/rubriques/femmes/koreanfacial.dart';

class EspaceFemmes extends StatelessWidget {
  const EspaceFemmes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          title: const Text("Espace Femmes", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                    "Découvrez les thérapies et les soins pour les Femmes !",
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Hijama",
                      destination: HijamaFemme(),
                    ),
                    SizedBox(width: 30),
                    RubriqueBoard(
                      text: "Auriculothérapie",
                      destination: AuriculotherapieFemme(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Détatouage",
                      destination: DetatouageFemme(),
                    ),
                    SizedBox(width: 30),

                    RubriqueBoard(
                      text: "Microneedling",
                      destination: Microneedling(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RubriqueBoard(
                      text: "Hydrafacial",
                      destination: Hydrafacial(),
                    ),
                    SizedBox(width: 30),

                    RubriqueBoard(
                      text: "Korean Facial",
                      destination: Koreanfacial(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
    );
  }
}