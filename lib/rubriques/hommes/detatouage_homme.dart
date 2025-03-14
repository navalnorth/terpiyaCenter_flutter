import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_explications.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:terapiya_center/rubriques/hommes/prendre_rdv_homme.dart';

class DetatouageHomme extends StatefulWidget {
  const DetatouageHomme({super.key});

  @override
  State<DetatouageHomme> createState() => _DetatouageHommeState();
}

class _DetatouageHommeState extends State<DetatouageHomme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DÉTATOUAGE LASER',
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
                  "LA SOLUTION SIMPLE ET EFFICACE POUR VOS TATOUAGES",
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
                  "Le détatouage laser est la méthode la plus moderne et efficace pour supprimer un tatouage de manière sûre et précise. Grâce à la technologie avancée des lasers, les pigments d’encre sont fragmentés et éliminés naturellement par le corps, sans endommager la peau environnante. Que vous souhaitiez enlever un tatouage indésirable ou corriger un ancien dessin, le détatouage laser offre une solution rapide, avec un minimum de douleur et de cicatrices. Notre équipe d’experts vous accompagne tout au long du processus pour vous garantir des résultats optimaux et une peau saine.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/detatouage.jpg'),
              const SizedBox(
                height: 30,
              ),
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
              const SizedBox(
                height: 20,
              ),
              const DeroulantExplications(
                title: "Comment fonctionne le détatouage laser ?",
                introText:
                    "Le laser cible les pigments de l'encre du tatouage et les décompose en petites particules, qui sont ensuite éliminées naturellement par le corps.",
              ),
              const SizedBox(
                height: 5,
              ),
              const DeroulantExplications(
                title: "Est-ce que le étatouage au laser est douleureux ?",
                introText:
                    "La douleur est généralement supportable, ressentie comme de petits picotements. Des crèmes anesthésiantes peuvent être utilisées pour minimiser l'inconfort.",
              ),
              const SizedBox(
                height: 5,
              ),
              const DeroulantExplications(
                title:
                    "Combien de séances sont nécessaires pour enlever un tatouage ?",
                introText:
                    "Le nombre de séances varie en fonction de la taille, de la couleur et de l'âge du tatouage, généralement entre 4 et 8 séances, espacées de 6 à 8 semaines.",
              ),
              const SizedBox(
                height: 5,
              ),
              const DeroulantExplications(
                title: "Y a-t-il des risques de cicarices ?",
                introText:
                    "Les risques de cicatrices sont faibles si les instructions post-traitement sont suivies correctement. La peau peut légèrement rougir ou gonfler après la séance, mais cela disparaît rapidement.",
              ),
              const SizedBox(
                height: 5,
              ),
              const DeroulantExplications(
                title:
                    "Puis-je reprendre mes activités après une séance de détatouage ?",
                introText:
                    "Oui, vous pouvez reprendre vos activités normales, mais il est conseillé d'éviter l'exposition au soleil et de suivre les soins recommandés pour favoriser la guérison de la peau.",
              ),
              const SizedBox(
                height: 20,
              ),
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
                title: "SMALL",
                prix: "60€",
                introText: "Ce prix est réservé aux tatouage mesurant moins de 10 cm \n",
                introText2: "Durée de la séance :",
                introText3: "30 min \n",
              ),
              const SizedBox(height: 5,),
        
              const DeroulantPrix(
                title: "MEDIUM",
                prix: "80€",
                introText: "Ce prix est réservé aux tatouages mesurant de 10cm à 20cm \n",
                introText2: "Durée de la séance :",
                introText4: "30 min \n",
              ),
              const SizedBox(height: 5,),
        
              const DeroulantPrix(
                title: "LARGE",
                prix: "100€",
                introText: "Ce prix est réservé pour les tatouages mesurant plus de 20cm \n",
                introText2: "Durée de la séance :",
                introText3: "30 min \n",
              ),
              const SizedBox(
                height: 50,
              ),
        
              CustomButton(
                  text: "Réserver un créneau",
                  borderColor: const Color.fromARGB(255, 53, 172, 177),
                  bgColor: const Color.fromARGB(255, 53, 172, 177),
                  txtColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const PrendreRdvHomme()));
                  }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
