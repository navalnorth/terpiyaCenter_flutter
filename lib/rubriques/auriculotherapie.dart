import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_explications.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';

class Auriculotherapie extends StatefulWidget {
  const Auriculotherapie({super.key});

  @override
  State<Auriculotherapie> createState() => _AuriculotherapieState();
}

class _AuriculotherapieState extends State<Auriculotherapie> {
  List<String> protocoles = [
    "Cigarette",
    "Drogue",
    "Médicaments",
    "Ballons",
    "Chichas",
    "Sucre",
    "Satiété",
    "Alcool",
    "Stress",
    "Anxiété",
    "Dépression",
    "Insomnie",
    "Allergie"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AURICULOTHÉRAPIE LASER',
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
                "LA THÉRAPIE QUI VA VOUS SURPRENDRE",
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
                "L'auriculothérapie laser est une approche non invasive qui utilise des faisceaux laser doux pour stimuler des points spécifiques de l'oreille, afin de traiter divers troubles comme le stress, la douleur, ou encore les addictions, telles que le sevrage tabagique. Grâce à sa précision et son efficacité, cette méthode agit directement sur le système nerveux pour rétablir l'équilibre du corps et favoriser la détente. Sans aiguilles et sans douleur, l'auriculothérapie laser est une solution naturelle idéale pour ceux qui recherchent un traitement doux et ciblé.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/auriculotherapie.jpg'),
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
              title: "Comment fonctionne l'auriculothérapie laser ?",
              introText:
                  "L'auriculothérapie laser stimule des points spécifiques sur l'oreille en utilisant un faisceau laser de faible intensité. Ces points, reliés à différentes fonctions corporelles, sont activés pour favoriser un rééquilibrage énergétique, soulager la douleur, réduire le stress et aider à traiter certaines dépendances comme le tabagisme.",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Est-ce que l'auriculothérapie laser est douleureuse ?",
              introText:
                  "Non, l'auriculothérapie laser est totalement indolore. Contrairement à l'acupuncture traditionnelle, cette méthode utilise un faisceau laser doux, sans aiguilles, ce qui la rend totalement non invasive et agréable. Vous pourriez ressentir une légère chaleur, mais aucune douleur.",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Est-ce que cette thérapie est sûre ?",
              introText:
                  "Oui, l'auriculothérapie laser est une méthode totalement sûre. En stimulant les terminaisons nerveuses situées sur le pavillon de l'oreille, nous activons un processus d'auto guérison, ce qui permet au corps de se soigner lui-même. Ce qui fait de cette thérapie, une thérapie très sûre",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title:
                  "L'auriculothérapie laser peut-elle traiter d'autres problèmes que le tabac ?",
              introText:
                  "Oui, cette méthode peut traiter une large gamme de problèmes. Dans notre centre, nous vous proposons les protocoles suivants : ",
              content: [
                "Cigarette",
                "Drogue",
                "Médicaments",
                "Ballons",
                "Chichas",
                "Sucre",
                "Satiété",
                "Alcool",
                "Stress",
                "Anxiété",
                "Dépression",
                "Insomnie",
                "Allergie",
              ],
              introText2:
                  "Chaque traitement est personnalisé selon vos besoins.",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Y a-t-il des effets secondaires ?",
              introText:
                  "Non, les effets secondaires sont extrêmement rares. Vous pouvez parfois ressentir une légère sensation de chaleur ou de picotement au niveau de l'oreille, mais cela disparaît instantanément. Nous utilisons un laser doux/froid biostimulant qui est complètement indolore et sans effets secondaires",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Après combien de temps les résultats aparaissent ?",
              introText: "Après combien de temps les résultats aparaissent ?",
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
            const SizedBox(height: 20),

            const DeroulantPrix(
              title: "Troubles Psychiques",
              prix: "50€",
              introText: "TROUBLE AU CHOIX : \n",
              introText2: "Stress \n",
              introText3: "Anxiété \n",
              introText4: "Dépression +0€ \n",
              introText5: "Allergie \n",
              introText6: "Insomnie \n",
            ),
            const SizedBox(height: 5),

            const DeroulantPrix(
              title: "Addictions",
              prix: "180€",
              introText: "ADDICTION AU CHOIX : \n",
              introText2: "Cigarette \n",
              introText3: "Drogue \n",
              introText4: "Médicaments +0€ \n",
              introText5: "Alcool \n",
              introText6: "Sucre \n",
              introText7: "Satiété \n",
              introText8: "Garantie d'une année : \n 2 séances gratuites en cas de rechute",
            ),
            const SizedBox(
              height: 50,
            ),

            CustomButton(
                text: "Réserver un créneau",
                borderColor: const Color.fromARGB(255, 53, 172, 177),
                bgColor: const Color.fromARGB(255, 53, 172, 177),
                txtColor: Colors.white,
                onPressed: () {}),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
