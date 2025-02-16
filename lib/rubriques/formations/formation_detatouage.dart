import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_explications.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:url_launcher/url_launcher.dart';

class FormationDetatouage extends StatefulWidget {
  const FormationDetatouage({super.key});

  @override
  State<FormationDetatouage> createState() => _FormationDetatouageState();
}

class _FormationDetatouageState extends State<FormationDetatouage> {
  Future<void> _openWhatsApp() async {
    const String phoneNumber = "+32488396428";
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

    try {
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        throw Exception("Impossible d'ouvrir WhatsApp");
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FORMATION EN DÉTATOUAGE',
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
                "EFFACER POUR RECOMMENCER",
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
                "Découvrez les techniques de détatouage lors de notre formation spécialisée. Apprenez à utiliser des méthodes sûres et efficaces pour éliminer les tatouages, tout en respectant la peau et en minimisant l’inconfort. Cette formation couvre les aspects pratiques, les protocoles de sécurité et les soins post-traitement. Que vous soyez professionnel de la santé ou passionné par l’esthétique, rejoignez-nous pour maîtriser cette compétence en pleine expansion et aider vos clients à retrouver une peau sans marques.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/formations/detatouageformation.jpg'),
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
                  "EN SAVOIR PLUS SUR CETTE FORMATION",
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
              title: "Quels types de formation proposons-nous ?",
              introText:
                  "Nous avons l'honneur de vous présenter 3 types de formations :",
              content: [
                "Formation de groupe (4 à 6 personnes) en présentiel",
                "Formation en solo en présentiel",
                "Formation en solo en présentiel"
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Combien de temps dure la formation ?",
              content: [
                "Formation de groupe : 1 journée",
                "Formation en solo : 1 journée",
                "Formation à distance : 1/2 journée pour la partie pratique"
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "A qui s'adresse la formation ?",
              introText:
                  "Notre formation s'adresse à tout le monde ! Que vous soyez débutant ou professionnel de la santé, nous reprenons les bases depuis le début, rendant cette pratique accessible à tous. Rejoignez-nous pour découvrir les incroyable avantage de cette formation, quel que soit votre niveau d'expérience.",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Où se déroule la formation ?",
              introText:
                  "Elle se déroule en notre cabinet directement, situé sur Mouscron (7700) en Belgique. Des déplacements sont envisageable sous certaines conditions",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Pourquoi se former ?",
              introText:
                  "Se former au laser détatouage, c'est acquérir une compétence recherchée dans un secteur en pleine expansion. Cette formation vous permet de maîtriser une technologie de pointe, offrant des résultats efficaces et sûrs pour les personnes souhaitant se débarrasser de leurs tatouages indésirables. En tant que professionnel certifié, vous pourrez répondre à une demande croissante, tout en garantissant des soins de qualité dans un environnement sécurisé. En vous formant au laser détatouage, vous développez une expertise précieuse, augmentant ainsi vos opportunités professionnelles et votre crédibilité dans le domaine de l'esthétique.",
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
            const SizedBox(height: 15),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Pour vous inscrire à l'une de nos formations, un acompte (remboursable uniquement en cas d'annulation au moins 24h à l'avance) vous sera demandé afin de valider votre inscription. L'inscription se fait via WhatsApp (lien disponible en bas de page). N'hésitez pas à nous contacter pour connaitre nos prochaines dates !",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),

            const DeroulantPrix(
              title: "DISTANCIEL",
              prix: "500€",
              introText: "Théorie en distanciel \n",
              introText2: "Examen en présentiel \n",
              introText3: "Pratique en présentiel",
              introText4: "Prévoir un modèle \n",
              introText6: "Suivi post-formation d'un an \n",
              introText9: "Date de formation : \n",
              introText10: "au choix \n",
              introText11: "Certificat d'aptitude",
            ),
            const SizedBox(height: 5,),

            const DeroulantPrix(
              title: "PRÉSENTIEL EN GROUPE",
              prix: "700€",
              introText: "Groupe de 4 à 8 personnes \n",
              introText2: "Théorie + pratique \n",
              introText3: "Prévoir un modèle",
              introText5: "Suivi post-formation d'un an \n",
              introText6: "Durée de formation : \n",
              introText7: "1 journée \n",
              introText8: "Date de formation : \n",
              introText9: "Imposé par nous même \n",
              introText10: "Certificat d'aptitude",
            ),
            const SizedBox(height: 5,),

            const DeroulantPrix(
              title: "PRÉSENTIEL EN SOLO",
              prix: "900€",
              introText: "Théorie + pratique \n",
              introText2: "Prévoir un modèle \n",
              introText4: "Suivi-post formation d'un an \n",
              introText5: "Durée de formation : \n",
              introText6: "1 journée \n",
              introText7: "Date de formation : \n",
              introText8: "au choix \n",
              introText9: "Certificat d'aptitude",
            ),

            const SizedBox(
              height: 40,
            ),

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
                }),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
