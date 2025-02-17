import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/deroulant_explications.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';
import 'package:url_launcher/url_launcher.dart';

class FormationHijama extends StatefulWidget {
  const FormationHijama({super.key});

  @override
  State<FormationHijama> createState() => _FormationHijamaState();
}

class _FormationHijamaState extends State<FormationHijama> {
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
          'FORMATION EN HIJAMA',
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
                "DÉCOUVREZ L'ART DE LA VENTOUSE",
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
                "Apprenez à pratiquer la hijama, une méthode ancestrale de soin, reconnue pour ses bienfaits sur la circulation, la gestion de la douleur et le bien-être général. Notre formation, animée par des experts certifiés, vous permettra d'acquérir les compétences nécessaires pour pratiquer en toute sécurité. Rejoignez-nous et explorez cette pratique thérapeutique naturelle pour améliorer votre santé ou celle des autres.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/formations/hijamaformation.jpg'),
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
                  "Nous avons l'honneur de vous présenter 3 types de formations : ",
              content: [
                "Formation de groupe (4 à 6 personnes) en présentiel",
                "Formation en solo en présentiel",
                "Formation en distanciel (partie pratique en présentiel)",
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Combien de temps dure la formation ?",
              content: [
                "Formation de groupe : 3 jours",
                "Formation en solo : 2 jours",
                "Formation à distance : 1/2 journée pour la partie pratique",
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "A qui s'adresse la formation ?",
              introText:
                  "Notre formation hijama s'adresse à tout le monde ! Que vous soyez débutant ou professionnel de la santé, nous reprenons les bases depuis le début, rendant cette pratique accessible à tous. Rejoignez-nous pour découvrir les bienfaits de la hijama, quel que soit votre niveau d'expérience.",
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
                  "Se former à la hijama permet d'acquérir des compétences précieuses dans une méthode de soin naturelle et efficace. Vous apprendrez à soulager diverses douleurs, à améliorer la circulation et à favoriser le bien-être général. De plus, cette formation enrichit votre pratique professionnelle en ajoutant une approche complémentaire à votre palette de soins. C'est une occasion d'aider les autres tout en développant vos connaissances sur la santé holistique.",
            ),
            const SizedBox(
              height: 5,
            ),
            const DeroulantExplications(
              title: "Quel en sera le programme ?",
              introText:
                  "Pour la partie pratique, nous y verrons 3 techniques différentes : ",
              content: [
                "La hijama classique",
                "Le Move Cupping",
                "Le flash Cupping",
              ],
              introText2:
                  "En ce qui concerne la partie théorique, nous y aborderons tant l'aspect scientifique que religieux de la hijama tout en y étudier ses différents aspects. La partie théorique sera ponctuée par un examen",
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
            const SizedBox(height: 50),

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
              prix: "350€",
              introText: "Théorie en distanciel \n",
              introText2: "Examen en présentiel \n",
              introText3: "Pratique en présentiel",
              introText4: "Prévoir un modèle \n",
              introText5: "+/- 100 protocoles fournis \n",
              introText6: "Suivi post-formation d'un an \n",
              introText7: "Durée du présentiel : \n",
              introText8: "1/2 journée \n",
              introText9: "Date de formation : \n",
              introText10: "au choix \n",
              introText11: "Certificat d'aptitude",
            ),
            const SizedBox(height: 5,),

            const DeroulantPrix(
              title: "PRÉSENTIEL EN GROUPE",
              prix: "420€",
              introText: "Groupe de 4 à 8 personnes \n",
              introText2: "Théorie + examen + pratique \n",
              introText3: "Pas besoin de modèle",
              introText4: "+/- 100 protocoles fournis \n",
              introText5: "Suivi post-formation d'un an \n",
              introText6: "Durée de formation : \n",
              introText7: "3 jours \n",
              introText8: "Date de formation : \n",
              introText9: "Imposé par nous même \n",
              introText10: "Certificat d'aptitude",
            ),
            const SizedBox(height: 5,),

            const DeroulantPrix(
              title: "PRÉSENTIEL EN SOLO",
              prix: "500€",
              introText: "Théorie + examen + pratique \n",
              introText2: "Prévoir un modèle \n",
              introText3: "+/- 100 protocoles fournis",
              introText4: "Suivi-post formation d'un an \n",
              introText5: "Durée de formation : \n",
              introText6: "2 jours \n",
              introText7: "Date de formation : \n",
              introText8: "au choix \n",
              introText9: "Certificat d'aptitude",
            ),
            const SizedBox(
              height: 50,
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
