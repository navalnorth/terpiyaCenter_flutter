import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/chiffres_action_humanitaires.dart';
import 'package:terapiya_center/rubriques/dons/pay_don.dart';
import 'package:terapiya_center/composants/deroulant_prix.dart';

class Humanitaire extends StatefulWidget {
  final String? petitsPuits;
  final String? grandPuits;
  final String? moutons;
  final String? maisons;
  final String? arbres;
  final String? corans;
  final String? orphelins;
  final String? etudiants;
  final String? mosquee;
  final String? orphelinat;
  final String? ecole;

  const Humanitaire({
      this.petitsPuits,
      this.grandPuits,
      this.moutons,
      this.maisons,
      this.arbres,
      this.corans,
      this.orphelins,
      this.etudiants,
      this.mosquee,
      this.orphelinat,
      this.ecole,
      super.key
  });

  @override
  State<Humanitaire> createState() => _HumanitaireState();
}

class _HumanitaireState extends State<Humanitaire> {
  Map<String, dynamic> chiffresHumanitaires = {};

  Future<void> _fetchChiffresHumanitaires() async {
    final DocumentSnapshot docSnapchot = await FirebaseFirestore.instance.collection("chiffresHumanitaires").doc("KPuKyPiYjBjkDRrB7axJ").get();

    if (docSnapchot.exists) {
      final Map<String, dynamic> data = docSnapchot.data() as Map<String, dynamic>;

      setState(() {
        chiffresHumanitaires = data.map((key, value) => MapEntry(key, value.toString()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchChiffresHumanitaires();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ACTIONS HUMANITAIRES',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      "Depuis notre lancement dans l'humanitaire le 19 janvier 2023, voici ce que nous avons accompli en chiffres\n",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['petitsPuits'] ?? "1037", label: "PETITS PUITS", fontSize: 28, fontSize2: 16,),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['grandPuits'] ?? "96", label: "GRAND PUITS", fontSize: 28, fontSize2: 16,),
                        const SizedBox( width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['moutons'] ?? "495", label: "MOUTONS", fontSize: 28, fontSize2: 16,),
                      ],
                    ),
                    const SizedBox(height: 20),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['maisons'] ?? "45", label: "MAISONS"),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['arbres'] ?? "1413", label: "ARBRES"),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['corans'] ?? "2097", label: "CORANS"),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['orphelins'] ?? "52", label: "ORPHELINS Á CHARGE"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['etudiants'] ?? "120", label: "ÉTUDIANTS Á CHARGE"),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['mosquee'] ?? "4", label: "MOSQUÉES"),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['orphelinat'] ?? "1", label: "ORPHELINAT"),
                        const SizedBox(width: 15),
                        ChiffresActionHumanitaires(number: chiffresHumanitaires['ecole'] ?? "2", label: "ÉCOLES CORANIQUES"),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Contribuez à cette noble cause en cliquant sur le lien WhatsApp en bas de page.Nous vous enverrons la procédure détaillée pour effectuer votre don. Qu’Allah récompense votre générosité !",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeroulantPrix(
                title: "PETIT PUITS",
                prix: "170 €",
                introText: "Plaque personnalisée \n",
                introText2: "Durée de vie :",
                introText3: "+/- 2 ans \n",
                introText4: "Suivi :",
                introText5: "photos/vidéos \n",
                introText7: "Délai de construction :",
                introText8: "3 à 12 semaines \n",
                introText9: "Lieu de construction :",
                introText10: "Madagascar",
                introText11: "Toliara",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "PETIT PUITS 2",
                prix: "250 €",
                introText: "Plaque personnalisée \n",
                introText2: "Durée de vie :",
                introText3: "+/- 5 ans",
                introText4: "Suivi :",
                introText5: "photos/vidéos \n",
                introText7: "Délai de construction :",
                introText8: "3 à 12 semaines \n",
                introText9: "Lieu de construction :",
                introText10: "Madagascar",
                introText11: "Tamatave",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "GRAND PUITS",
                prix: "500 €",
                introText: "Plaque personnalisée \n",
                introText2: "Durée de vie :",
                introText3: "'à vie' \n",
                introText4: "Suivi :",
                introText5: "photos/vidéos \n",
                introText7: "Délai de construction :",
                introText8: "3 à 12 semaines \n",
                introText9: "Lieu de construction :",
                introText10: "Madagascar",
                introText11: "Toliara",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "MOUTONS",
                prix: "80 €",
                introText: "Plaque personnalisée \n",
                introText2: "Suivi :",
                introText3: "photos/vidéos \n",
                introText4: "Délai de sacrifice :",
                introText5: "Quelques jours \n",
                introText6: "Lieu de sacrifice :",
                introText7: "Madagascar",
                introText8: "Toliara \n",
                introText9: "La viande est distribué aux nécessiteux",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "MAISONS",
                prix: "130 €",
                introText: "Plaque personnalisée \n",
                introText2: "Suivi :",
                introText3: "photos/vidéos \n",
                introText4: "Délai de construction :",
                introText5: "Quelques jours \n",
                introText6: "Lieu de construction :",
                introText7: "Madagascar",
                introText8: "Toliara \n",
                introText9: "Superficie de la maison :",
                introText10: "+/- 10m2",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "ARBRES",
                prix: "3 €",
                introText: "Plaque personnalisée \n",
                introText2: "Suivi :",
                introText3: "photos/vidéos \n",
                introText4: "Délai de plantation :",
                introText5: "Quelques jours \n",
                introText6: "Lieu de construction :",
                introText7: "Madagascar",
                introText8: "Toliara \n",
                introText9: "Plantation arbres fruitiers",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "CORANS",
                prix: "5 €",
                introText: "Délai de distribution :",
                introText4: "Quelques Jours\n",
                introText5: "Lieu de distribution :",
                introText7: "Tanzanie",
                introText8: "Zanzibar \n",
                introText9: "Lieu visé :",
                introText10: "Mosquée et/ou école coranique",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "PARRAINAGE ETUDIANT",
                prix: "95€ /an ",
                introText: "Parrainage possible : \n",
                introText2: "Étudiant en sciences islamique à Zanzibar \n",
                introText3: "Lieu de distribution : ",
                introText4: "Tanzanie",
                introText5: "Zanzibar \n",
                introText10: "Le prix variera en fonction de votre choix",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "PARRAINAGE ORPHELIN",
                prix: "260€/an",
                introText: "Parrainage possible : \n",
                introText6: "Lieu visé :",
                introText7: "Mosquée et/ou école coranique \n",
                introText8: "Orphelins à Madagascar \n",
                introText9: "Orphelins à Zanzibar \n",
                introText10: "Le prix variera en fonction de votre choix",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "MOSQUÉE",
                prix: "16500€",
                introText: "Ce tarif comprend : \n",
                introText2: "\u2705 Achat du terrain",
                introText3: "\u2705 Un grand puits",
                introText4: "\u2705 Banc d'ablutions",
                introText5: "\u2705 Matériel nécessaire complet",
                introText6: "\u2705 Plaque personnalisée",
                introText7: "\u2705 Suivi personnalisée \n",
                introText8: "Superficie mosquée :",
                introText9: "environ 80m2 \n",
                introText10: "Lieu de construction :",
                introText11: "Madagascar \n",
                introText12: "Délai de construction :",
                introText13: "+/- 6 mois",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "ÉCOLE CORANIQUE",
                prix: "8000€",
                introText: "Ce tarif comprend : \n",
                introText2: "\u2705 Achat du terrain",
                introText3: "\u2705 2 salles de classe",
                introText4: "\u2705 Un grand puits",
                introText5: "\u2705 Matériel nécessaire complet",
                introText6: "\u2705 Plaque personnalisée",
                introText7: "\u2705 Suivi personnalisée \n",
                introText8: "Superficie par classe :",
                introText9: "+/-30m2 \n",
                introText10: "Lieu de construction :",
                introText11: "Madagascar \n",
                introText12: "Délai de construction :",
                introText13: "+/- 6 mois",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "COLIS ALIMENTAIRE",
                prix: "70€",
                introText: "Le colis comprend : \n",
                introText2: "\u2705 Du riz",
                introText3: "\u2705 De la farine",
                introText4: "\u2705 Du sucre",
                introText5: "\u2705 Des paquets de spaghettis",
                introText6: "\u2705 Plaque personnalisée",
                introText7: "\u2705 De l'huile",
                introText8: "\u2705 Des boites de sardines",
                introText9: "\u2705 Des dates et du thé \n",
                introText10: "Suivi :",
                introText11: "photos/vidéos",
                introText12: "plaque personnalisé \n",
                introText13:
                    "Ce colis est destiné pour une famille complète pour une durée d'un mois",
              ),
              const SizedBox(height: 5),
              const DeroulantPrix(
                title: "COLIS ALIMENTAIRE",
                prix: "2€",
                introText: "Le repas comprend généralement : \n",
                introText2: "\u2705 Du riz",
                introText3: "\u2705 De la viande",
                introText4: "\u2705 1 fruit",
                introText5: "\u2705 1 boisson",
                introText6: "\u2705 Plaque personnalisée \n",
                introText7: "Suivi :",
                introText8: "photos/vidéos",
              ),
              const SizedBox(height: 5),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "Faire un don",
                  borderColor: const Color.fromARGB(255, 53, 172, 177),
                  bgColor: const Color.fromARGB(255, 53, 172, 177),
                  txtColor: Colors.white,
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PayDon()));
                  }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
