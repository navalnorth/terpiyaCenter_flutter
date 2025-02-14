import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/rdv/prendre_rdv.dart';

class Hijama extends StatefulWidget {
  const Hijama({super.key});

  @override
  State<Hijama> createState() => _HijamaState();
}

class _HijamaState extends State<Hijama> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HIJAMA', style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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

            Image.asset('assets/hijama.jpg'),
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
                    "Comment fonctionne la hijama ?",
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
                        "La hijama consiste à poser des ventouses sur des points spécifiques du corps. Elles créent une aspiration qui stimule la circulation sanguine, détoxifie et soulage les douleurs musculaires.",
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
                    "La hijama peut-elle être utilisée pour traiter des douleurs chroniques ?",
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
                        "Oui, la hijama est particulièrement efficace pour soulager les douleurs chroniques comme les douleurs lombaires, les maux de tête et les douleurs articulaires.",
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
                    "Combien de temps dur une séance de hijama ?",
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
                        "Une séance dure généralement entre 20 et 40 minutes, selon la zone traitée et les besoins spécifiques du patient.",
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
                    "Est-ce que la hijama peut aider à réduire le stress et l'anxiété ?",
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
                        "Oui, la hijama stimule la production d'endorphines et aide à libérer les tensions, ce qui peut réduire considérablement le stress et l'anxiété.",
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
                    "Ques sont les bénéfics imméiats après une séance de hijama ?",
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
                        "Les bénéfices immédiats peuvent inclure une sensation de détente, de légèreté et une réduction des douleurs ou tensions musculaires.",
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

            Image.asset("assets/hijamaprix.jpg"),
            const SizedBox(height: 40,),

            CustomButton(
              text: "Réserver un créneau", 
              borderColor: const Color.fromARGB(255, 53, 172, 177), 
              bgColor: const Color.fromARGB(255, 53, 172, 177), 
              txtColor: Colors.white, 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrendreRdv()));
              }
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
