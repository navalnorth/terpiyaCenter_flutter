import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/rubriques/formations/formation_auriculotherapie.dart';
import 'package:terapiya_center/rubriques/formations/formation_detatouage.dart';
import 'package:terapiya_center/rubriques/formations/formation_hijama.dart';

class FormationsHome extends StatelessWidget {
  const FormationsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          title: const Text("Formations", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Formez vous pour devenir des spécialistes de chaque thérapie !",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FormationHijama()));
                  },

                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 53, 172, 177),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Center(
                      child: Text(
                        "Formation en Hijama",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FormationAuriculotherapie()));
                  },

                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 53, 172, 177),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Center(
                      child: Text(
                        "Formation en Auriculothérapie",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FormationDetatouage()));
                  },

                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 53, 172, 177),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Center(
                      child: Text(
                        "Formation en Détatouage",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}