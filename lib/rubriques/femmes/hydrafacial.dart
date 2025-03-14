import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:terapiya_center/rubriques/femmes/prendre_rdv_femme.dart';

class Hydrafacial extends StatefulWidget {
  const Hydrafacial({super.key});

  @override
  State<Hydrafacial> createState() => _HydrafacialState();
}

class _HydrafacialState extends State<Hydrafacial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HYDRAFACIAL',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "NETTOYEZ VOTRE PEAU",
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
                  "L'Hydrafacial est un soin esthétique non invasif qui combine nettoyage, exfoliation, extraction des impuretés et hydratation intense en une seule séance. Il est souvent apprécié pour son effet “peau neuve” immédiat, sans irritation ni temps de récupération.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              
              Image.asset('assets/hydra.jpg'),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 53, 172, 177),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "LES BIENFAITS DE L'HYDRAFACIAL",
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
                    Text("• Teint plus lumineux et éclatant dès la première séance.\n"),
                    Text("• Nettoyage en profondeur des pores, idéal pour les peaux sujettes aux points noirs et imperfections.\n"),
                    Text("• Hydratation intense grâce aux sérums infusés.\n"),
                    Text("• Effet anti-âge avec une peau repulpée et lissée.\n"),
                    Text("• Convient à tous les types de peau, même sensibles."),
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
                title: "Prix de l'hydrafacial",
                prix: "65€",
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
      ),
    );
  }
}
