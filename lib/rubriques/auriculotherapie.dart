import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';

class Auriculotherapie extends StatefulWidget {
  const Auriculotherapie({super.key});

  @override
  State<Auriculotherapie> createState() => _AuriculotherapieState();
}

class _AuriculotherapieState extends State<Auriculotherapie> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;

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
        title: const Text('AURICULOTHÉRAPIE LASER', style: TextStyle(fontSize: 15),),
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
            const SizedBox(height: 30,),

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
            const SizedBox(height: 20,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 53, 172, 177), width: 2)
                ),
                child: ExpansionTile(
                  title: Text(
                    "Comment fonctionne l'auriculothérapie laser ?",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded = expanded;
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "L'auriculothérapie laser stimule des points spécifiques sur l'oreille en utilisant un faisceau laser de faible intensité. Ces points, reliés à différentes fonctions corporelles, sont activés pour favoriser un rééquilibrage énergétique, soulager la douleur, réduire le stress et aider à traiter certaines dépendances comme le tabagisme.",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 53, 172, 177), width: 2)
                ),
                child: ExpansionTile(
                  title: Text(
                    "Est-ce que l'auriculothérapie laser est douleureuse ?",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded2 ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded2 = expanded;
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Non, l'auriculothérapie laser est totalement indolore. Contrairement à l'acupuncture traditionnelle, cette méthode utilise un faisceau laser doux, sans aiguilles, ce qui la rend totalement non invasive et agréable. Vous pourriez ressentir une légère chaleur, mais aucune douleur.",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 53, 172, 177), width: 2)
                ),
                child: ExpansionTile(
                  title: Text(
                    "Est-ce que cette thérapie est sûre ?",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded3 ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded3 = expanded;
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Oui, l'auriculothérapie laser est une méthode totalement sûre. En stimulant les terminaisons nerveuses situées sur le pavillon de l'oreille, nous activons un processus d'auto guérison, ce qui permet au corps de se soigner lui-même. Ce qui fait de cette thérapie, une thérapie très sûre",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 53, 172, 177), width: 2),
                ),
                child: ExpansionTile(
                  title: Text(
                    "L'auriculothérapie laser peut-elle traiter d'autres problèmes que le tabac ?",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded4 ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded4 = expanded;
                    });
                  },
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Oui, cette méthode peut traiter une large gamme de problèmes. Dans notre centre, nous vous proposons les protocoles suivants :",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: protocoles.map((protocole) {
                          return Row(
                            children: [
                              const Icon(Icons.circle, size: 8, color: Colors.black), 
                              const SizedBox(width: 8),
                              Text(protocole),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),

        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 53, 172, 177), width: 2)
                ),
                child: ExpansionTile(
                  title: Text(
                    "Y a-t-il des effets secondaires ?",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded5 ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded5 = expanded;
                    });
                  },
        
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Non, les effets secondaires sont extrêmement rares. Vous pouvez parfois ressentir une légère sensation de chaleur ou de picotement au niveau de l'oreille, mais cela disparaît instantanément. Nous utilisons un laser doux/froid biostimulant qui est complètement indolore et sans effets secondaires",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 53, 172, 177), width: 2)
                ),
                child: ExpansionTile(
                  title: Text(
                    "Après combien de temps les résultats aparaissent ?",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    _isExpanded5 ? Icons.remove : Icons.add,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded5 = expanded;
                    });
                  },
        
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "En ce qui concerne les addictions, le résultat est instantané, une seule suffit à vous sevrer complètement de votre addiction. Pour les troubles psychiques il faut, en moyenne, 3 séances. Cependant, des améliorations peuvent être perçues dès la première séance ",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

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

            Image.asset("assets/auriculotherapieprix.jpg"),

            Image.asset("assets/auriculotherapieprix2.jpg"),
            const SizedBox(height: 40,),

            CustomButton(
              text: "Réserver un créneau", 
              borderColor: const Color.fromARGB(255, 53, 172, 177), 
              bgColor: const Color.fromARGB(255, 53, 172, 177), 
              txtColor: Colors.white, 
              onPressed: () {}
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
