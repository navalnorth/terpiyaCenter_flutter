import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class FormationAuriculotherapie extends StatefulWidget {
  const FormationAuriculotherapie({super.key});

  @override
  State<FormationAuriculotherapie> createState() => _FormationAuriculotherapieState();
}

class _FormationAuriculotherapieState extends State<FormationAuriculotherapie> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;

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
        title: const Text('FORMATION EN AURICULOTHÉRAPIE', style: TextStyle(fontSize: 15),),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "DÉCOUVREZ L'AURICULOTHÉRAPIE LASER",
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
                "Découvrez l'auriculothérapie laser, une approche innovante de la médecine douce. Cette formation vous apprendra à utiliser le laser pour stimuler des points précis de l'oreille, favorisant ainsi le bien-être et la gestion de diverses affections. Acquérez des compétences pratiques et théoriques pour intégrer cette méthode efficace dans votre pratique ou votre quotidien. Rejoignez-nous pour explorer les avantages de cette technique sans douleur et accessible à tous.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            Image.asset('assets/formations/auriculotherapieformation.jpg'),
            const SizedBox(height: 30,),

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
                    "Quels types de formation proposons-nous ?",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nous avons l'honneur de vous présenter 3 types de formations : "),
                          SizedBox(height: 5),
                          Text("\u2022 Formation de groupe (4 à 6 personnes) en présentiel"),
                          Text("\u2022 Formation en solo en présentiel"),
                          Text("\u2022 Formation en distanciel (partie pratique en présentiel)"),
                        ],
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
                    "Combien de temps dure la formation ?",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\u2022 Formation de groupe : 2 jours"),
                          Text("\u2022 Formation en solo : 1 journée"),
                          Text("\u2022 Formation à distance : 1/2 journée pour la partie pratique"),
                        ],
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
                    "A qui s'adresse la formation ?",
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
                        "Notre formation d'auriculothérapie s'adresse à tout le monde ! Que vous soyez débutant ou professionnel de la santé, nous reprenons les bases depuis le début, rendant cette pratique accessible à tous. Rejoignez-nous pour découvrir les bienfaits de l'auriculo, quel que soit votre niveau d'expérience.",
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
                    "Où se déroule la formation ?",
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
                        "Elle se déroule en notre cabinet directement, situé sur Mouscron (7700) en Belgique. Des déplacements sont envisageable sous certaines conditions",
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
                    "Pourquoi se former ?",
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
                        "Se former à l'auriculo permet d'acquérir des compétences précieuses dans une méthode de soin naturelle et efficace. Vous apprendrez à sevrer les addictions et à soulager les gens de leurs troubles psychiques. De plus, cette formation enrichit votre pratique professionnelle en ajoutant une approche complémentaire à votre palette de soins. C'est une occasion d'aider les autres tout en développant vos connaissances sur la santé.",
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
                    "Quels sont les protocoles fournis pendant la formation ?",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Les protocoles sont inclus dans la formation : "),
                          SizedBox(height: 5),
                          Text("\u2022 Cigarette"),
                          Text("\u2022 Drogue"),
                          Text("\u2022 Alcool"),
                          Text("\u2022 Sucre"),
                          Text("\u2022 Satiété"),
                          Text("\u2022 Stress"),
                          Text("\u2022 Anxiété"),
                          Text("\u2022 Dépression"),
                          Text("\u2022 Insomnie"),
                          Text("\u2022 Allergie"),
                        ],
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

            Image.asset("assets/formations/auriculotherapieprixformation.jpg"),
            Image.asset("assets/formations/auriculotherapieprixformation2.jpg"),
            Image.asset("assets/formations/auriculotherapieprixformation3.jpg"),
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
