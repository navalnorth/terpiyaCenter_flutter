import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:terapiya_center/rubriques/femmes/prendre_rdv_femme.dart';

class Microneedling extends StatefulWidget {
  const Microneedling({super.key});

  @override
  State<Microneedling> createState() => _MicroneedlingState();
}

class _MicroneedlingState extends State<Microneedling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MICRONEEDLING',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "RÉGÉNÉREZ VOTRE PEAU",
                style: GoogleFonts.montserrat(
                  color: const Color.fromARGB(255, 53, 172, 177),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Le microneedling est une technique esthétique qui consiste à effectuer de micro-perforations dans la peau à l'aide d'un stylo électrique équipé de fines aiguilles. Ces micro-lésions stimulent le processus naturel de régénération cutanée, favorisant la production de collagène et d'élastine.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            
            Image.asset('assets/micro.jpg'),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 172, 177),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "LES BIENFAITS DU MICRONEEDLING",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Amélioration de la texture de la peau : Réduction des pores dilatés et affinage du grain de peau.\n"),
                  Text("• Atténuation des cicatrices : Efficace pour les cicatrices d'acné ou post-opératoires.\n"),
                  Text("• Réduction des rides et ridules : Effet tenseur grâce à la stimulation du collagène.\n"),
                  Text("• Unification du teint : Diminution des taches pigmentaires et des rougeurs.\n"),
                  Text("• Réduction des vergetures : Peut améliorer l'apparence des vergetures récentes."),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 172, 177),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "EXPLOREZ NOS TARIFS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const DeroulantPrix(
              title: "Prix du microneedling",
              prix: "70€",
            ),
            const SizedBox(height: 50),
            CustomButton(
                text: "Réserver un créneau",
                borderColor: const Color.fromARGB(255, 53, 172, 177),
                bgColor: const Color.fromARGB(255, 53, 172, 177),
                txtColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const PrendreRdvFemme()));
                }),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
