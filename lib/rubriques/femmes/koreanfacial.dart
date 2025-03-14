import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:terapiya_center/rubriques/femmes/prendre_rdv_femme.dart';

class Koreanfacial extends StatefulWidget {
  const Koreanfacial({super.key});

  @override
  State<Koreanfacial> createState() => _KoreanfacialState();
}

class _KoreanfacialState extends State<Koreanfacial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'KOREAN FACIAL',
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
                  "DONNEZ UN ECLAT A VOTRE PEAU",
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
                  "Le Korean Facial est un soin du visage inspiré des rituels coréens de la K-Beauty. Il combine nettoyage en profondeur, hydratation intense et techniques de massage pour une peau éclatante et rebondie. Contrairement aux soins classiques, il met l'accent sur l'éclat naturel, l'hydratation et la prévention du vieillissement cutané.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              
              Image.asset('assets/korean.jpg'),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 53, 172, 177),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "LES BIENFAITS DU KOREAN FAIAL",
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
                    Text("• Peau hydratée, repulpée et éclatante\n"),
                    Text("• Réduction des pores dilatés et des rougeurs\n"),
                    Text("• Hydratation intense grâce aux sérums infusés.\n"),
                    Text("• Effet anti-âge et raffermissant grâce au massage\n"),
                    Text("• Stimulation de la circulation sanguine et du drainage lymphatique"),
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
                title: "Prix du Korean",
                prix: "55€",
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
