import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/chiffres_action_humanitaires.dart';
import 'package:url_launcher/url_launcher.dart';

class Humanitaire extends StatefulWidget {
  const Humanitaire({super.key});

  @override
  State<Humanitaire> createState() => _HumanitaireState();
}

class _HumanitaireState extends State<Humanitaire> {

  Future<void> _openWhatsApp() async {
    const String phoneNumber = "+32488396428";
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

    try {
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        throw Exception("Impossible d'ouvrir WhatsApp");
      }
    } catch (_) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACTIONS HUMANITAIRES', style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "AGIR POUR LE BIEN : SOYEZ LE CHANGEMENT",
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
              child: Column(
                children: [
                  Text(
                    "Terapiya Center c'est aussi dans l'humanitaire. Nous nous sommes engager à aider ceux qui en ont besoin, en apportant soutien et solidarité face aux crises et aux injustices. C'est un acte de dignité et de respect des droits humains, visant à construire un monde plus juste et solidaire.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Image.asset('assets/humanitaireaide.jpg'),
            const SizedBox(height: 30,),

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 172, 177),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "VOICI NOS ACTIONS EN QUELQUES CHIFFRES",
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
              child: Column(
                children: [
                  const Text("Depuis notre lancement dans l'humanitaire le 19 janvier 2023, voici ce que nous avons accompli en chiffres\n", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UnderlinedText(number: "1037", label: "PETITS PUITS"),
                      SizedBox(width: 15,),
                      
                      UnderlinedText(number: "96", label: "GRAND PUITS"),
                      SizedBox(width: 15,),

                      UnderlinedText(number: "495", label: "MOUTONS"),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UnderlinedText(number: "45", label: "MAISONS"),
                      SizedBox(width: 15,),
                      
                      UnderlinedText(number: "1413", label: "ARBRES"),
                      SizedBox(width: 15,),

                      UnderlinedText(number: "2097", label: "CORANS"),
                      SizedBox(width: 15,),

                      UnderlinedText(number: "52", label: "ORPHELINS Á CHARGE"),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UnderlinedText(number: "120", label: "ÉTUDIANTS Á CHARGE​"),
                      SizedBox(width: 15,),
                      
                      UnderlinedText(number: "4", label: "MOSQUÉES"),
                      SizedBox(width: 15,),

                      UnderlinedText(number: "1", label: "ORPHELINAT"),
                      SizedBox(width: 15,),

                      UnderlinedText(number: "2", label: "ÉCOLES CORANIQUES"),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  const SizedBox(height: 30,),
                  Text(
                    "PRIX : 890€ PAR GROUPE",
                    style: GoogleFonts.montserrat(
                      color:  const Color.fromARGB(255, 53, 172, 177),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),


            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 172, 177),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "DÉCOUVREZ NOS ACTIONS ET NOS TARIFS",
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

            const Text("Contribuez à cette noble cause en cliquant sur le lien WhatsApp en bas de page.Nous vous enverrons la procédure détaillée pour effectuer votre don. Qu’Allah récompense votre générosité !", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            const SizedBox(height: 20,),


            CustomButton(
              text: "Contacter par Whatsapp", 
              borderColor: const Color.fromARGB(255, 53, 172, 177), 
              bgColor: const Color.fromARGB(255, 53, 172, 177), 
              txtColor: Colors.white, 
              image: Image.asset(
                "assets/whatsappLogo.png",
                width: 25,
                height: 25,
              ),
              onPressed: () async {
                _openWhatsApp();
              }
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
