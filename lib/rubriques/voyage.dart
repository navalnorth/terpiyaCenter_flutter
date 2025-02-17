import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class Voyage extends StatefulWidget {
  const Voyage({super.key});

  @override
  State<Voyage> createState() => _VoyageState();
}

class _VoyageState extends State<Voyage> {

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
        title: const Text('VOYAGES HUMANITAIRES', style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "PARTEZ EN VOYAGE HUMANITAIRE ET CHANGEZ DES VIES !",
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
                    "Nous vous invitons à rejoindre nos missions humanitaires à Madagascar. Plongez dans l'action, apportez votre aide et vivez une expérience à la fois incroyable et inoubliable.\n",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "⚠️ Les vols internationaux et nationaux ne sont pas inclus dans le prix.\n",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Pour vous inscrire ou obtenir plus d'informations, cliquez sur le lien WhatsApp en bas de page. Découvrez également nos précédents voyages sur Instagram grâce au lien dédié.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Image.asset('assets/madagascar.jpg'),
            const SizedBox(height: 30,),

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 172, 177),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "VOYAGE HUMANITAIRE MADAGASCAR",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Partez pour 7 jours d'engagement humanitaire à Madagascar. Ce voyage vous permettra de vivre une expérience unique en apportant votre aide directe à un orphelinat local.\n"),
                  const Text("Le prix comprend :\n"),
                  const Text("\u2022 Le logement directement à l'orphelinat.", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 Un repas par jour.", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 Les transports, y compris les trajets vers et depuis l'aéroport.", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 Les articles à distribuer inclus dans le programme, tels que les denrées alimentaires et autres besoins essentiels.\n", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("Pour vous inscrire ou obtenir plus d'informations, cliquez sur le lien WhatsApp en bas de page. Découvrez également nos précédents voyages sur Instagram grâce au lien dédié.\n"),
                  const Text("Voici le détail du programme :\n"),
                  const Text("\u2022 JOUR 1 : Visite de petits et de grands puits + rencontre avec les villageois", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 JOUR 2 : Distribution de denrées alimentaires aux villageois", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 JOUR 3 : Journée à l'orphelinat (repas + distribution de jouets et/ou vêtements aux enfants)", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 JOUR 4 : Participation à la construction d'un puits, d'une maison ou de plantations d'arbres", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 JOUR 5 : Journée à la plage avec les orphelins", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 JOUR 6 : Visite d'une école et d'un hôpital", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("\u2022 JOUR 7 : Journée détente à la plage ou à la piscine\n", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("Groupe de 1 à 5 personnes maximum"),
                  const Text("Le programme ainsi que le prix pourront évidemment être aménagé à votre convenance si besoin"),
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
            const SizedBox(height: 40,),

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