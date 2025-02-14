import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';

class Detatouage extends StatefulWidget {
  const Detatouage({super.key});

  @override
  State<Detatouage> createState() => _DetatouageState();
}

class _DetatouageState extends State<Detatouage> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DÉTATOUAGE LASER', style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
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
                    "Comment fonctionne le détatouage laser ?",
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
                        "Le laser cible les pigments de l'encre du tatouage et les décompose en petites particules, qui sont ensuite éliminées naturellement par le corps.",
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
                    "Est-ce que le étatouage au laser est douleureux ?",
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
                        "La douleur est généralement supportable, ressentie comme de petits picotements. Des crèmes anesthésiantes peuvent être utilisées pour minimiser l'inconfort.",
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
                    "Combien de séances sont nécessaires pour enlever un tatouage ?",
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
                        "Le nombre de séances varie en fonction de la taille, de la couleur et de l'âge du tatouage, généralement entre 4 et 8 séances, espacées de 6 à 8 semaines.",
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
                    "Y a-t-il des risques de cicarices ?",
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
                        "Les risques de cicatrices sont faibles si les instructions post-traitement sont suivies correctement. La peau peut légèrement rougir ou gonfler après la séance, mais cela disparaît rapidement.",
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
                    "Puis-je reprendre mes activités après une séance de détatouage ?",
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
        
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Oui, vous pouvez reprendre vos activités normales, mais il est conseillé d'éviter l'exposition au soleil et de suivre les soins recommandés pour favoriser la guérison de la peau.",
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

            Image.asset("assets/detatouageprix.jpg"),

            Image.asset("assets/detatouageprix2.jpg"),

            Image.asset("assets/detatouageprix3.jpg"),
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
