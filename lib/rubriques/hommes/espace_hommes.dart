import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/rubriques/hommes/auriculotherapie_homme.dart';
import 'package:terapiya_center/rubriques/hommes/detatouage_homme.dart';
import 'package:terapiya_center/rubriques/hommes/hijama_homme.dart';

class EspaceHommes extends StatelessWidget {
  const EspaceHommes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          title: const Text("Espace Hommes", style: TextStyle(color: Colors.white),),
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
                  "Découvrez les thérapies et les soins pour l'homme !",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HijamaHomme()));
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
                        "Hijama",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AuriculotherapieHomme()));
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
                        "Auriculothérapie",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetatouageHomme()));
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
                        "Détatouage",
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