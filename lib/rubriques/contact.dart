import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/deroulant_contact.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 172, 177),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "HORAIRES",
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

            const DeroulantContact(
              title: "HORAIRES HOMMES",
              cle: "Mercredi\n",
              valeur: "11h - 17h30\n",
              cle2: "Jeudi\n",
              valeur2: "11h - 17h30\n",
              cle3: "Samedi",
              valeur3: "11h - 17h30",
            ),
            const SizedBox(height: 5,),

            const DeroulantContact(
              title: "HORAIRES FEMMES",
              cle: "Lundi\n",
              valeur: "10h - 16h30\n",
              cle2: "Mardi\n",
              valeur2: "10h - 16h30\n",
              cle3: "Vendredi",
              valeur3: "10h - 16h30",
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
                  "CONTACT",
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

            const DeroulantContact(
              title: "CONTACT HOMMES",
              cle: "WhatsApp\n",
              valeur: "0488 396 428\n",
              cle2: "Téléphone\n",
              valeur2: "07 67 65 51 48\n",
              cle3: "SnapChat\n",
              valeur3: "terapiya.center\n",
              cle4: "Instagram\n",
              valeur4: "Terapiya Center\n",
              cle5: "Mail\n",
              valeur5: "terapiya.center@gmail.com\n",
            ),
            const SizedBox(height: 5,),

            const DeroulantContact(
              title: "CONTACT FEMMES",
              cle: "WhatsApp\n",
              valeur: "07 67 89 66 56\n",
              cle2: "SnapChat\n",
              valeur2: "soinlimaa\n",
              cle3: "Instagram",
              valeur3: "soin_lima",
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
                  "ADRESSE",
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

            Text(
              "119 Rue des croisiers",
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "7712 - Belgique",
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}