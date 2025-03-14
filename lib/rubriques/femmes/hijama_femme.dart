import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_explications.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:terapiya_center/rubriques/femmes/prendre_rdv_femme.dart';

class HijamaFemme extends StatefulWidget {
  const HijamaFemme({super.key});

  @override
  State<HijamaFemme> createState() => _HijamaFemmeState();
}

class _HijamaFemmeState extends State<HijamaFemme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HIJAMA',
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
                  "UNE THÉRAPIE NATURELLE POUR VOTRE BIEN-ÊTRE",
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
                  "La hijama, ou thérapie par ventouses, est une pratique ancestrale utilisée pour soulager les douleurs musculaires, améliorer la circulation sanguine et favoriser l’élimination des toxines. En appliquant des ventouses sur des points stratégiques du corps, cette méthode stimule la régénération cellulaire et aide à rééquilibrer l’énergie du corps. Simple, naturelle et efficace, la hijama est idéale pour ceux qui recherchent une solution alternative et complémentaire pour améliorer leur santé et leur bien-être au quotidien.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              
              Image.asset('assets/hijamafemme.jpg'),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 53, 172, 177),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "EN SAVOIR PLUS",
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
              const DeroulantExplications(
                title: "Comment fonctionne la hijama ?",
                introText:
                    "La hijama consiste à poser des ventouses sur des points spécifiques du corps. Elles créent une aspiration qui stimule la circulation sanguine, détoxifie et soulage les douleurs musculaires.",
              ),
              const SizedBox(height: 5),
              const DeroulantExplications(
                title:
                    "La hijama peut-elle être utilisée pour traiter des douleurs chroniques ?",
                introText:
                    "Oui, la hijama est particulièrement efficace pour soulager les douleurs chroniques comme les douleurs lombaires, les maux de tête et les douleurs articulaires.",
              ),
              const SizedBox(height: 5),
              const DeroulantExplications(
                title: "Combien de temps dur une séance de hijama ?",
                introText:
                    "Une séance dure généralement entre 20 et 40 minutes, selon la zone traitée et les besoins spécifiques du patient.",
              ),
              const SizedBox(
                height: 5,
              ),
              const DeroulantExplications(
                title:
                    "Est-ce que la hijama peut aider à réduire le stress et l'anxiété ?",
                introText:
                    "Oui, la hijama stimule la production d'endorphines et aide à libérer les tensions, ce qui peut réduire considérablement le stress et l'anxiété.",
              ),
              const SizedBox(height: 5),
              const DeroulantExplications(
                title:
                    "Quels sont les bénéfices immédiats après une séance de hijama ?",
                introText:
                    "Les bénéfices immédiats peuvent inclure une sensation de détente, de légèreté et une réduction des douleurs ou tensions musculaires.",
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
                title: "Prix de la hijama",
                prix: "30€",
                introText: "Hijama classique du dos \n",
                introText2: "Tête : +0€ \n",
                introText3: "Cou : +0€ \n",
                introText4: "Arrière des épaules : +0€ \n",
                introText5: "Bas du corps : +5€ \n",
                introText6: "L'avant du corps : +5€ \n",
                introText7: 'Massage: +20€',
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
