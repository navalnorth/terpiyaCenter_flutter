import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/rubriques/huamanitaires%20et%20voyages/humanitaire.dart';
import 'package:terapiya_center/rubriques/huamanitaires%20et%20voyages/voyage.dart';

class HumanitairesVoyages extends StatelessWidget {
  const HumanitairesVoyages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          title: const Text("Humanitaires et voyages", style: TextStyle(color: Colors.white),),
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

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Humanitaire()));
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
                        "Actions Humanitaires",
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
                const SizedBox(width: 30,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Voyage()));
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
                        "Voyages humanitaires",
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
                )
              ],
            ),
          ),
        ),
    );
  }
}