import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:terapiya_center/composants/deroulant_contact.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  void _openWhatsApp(String phoneNumber) async {
    final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Impossible d'ouvrir WhatsApp")),
    );
    }
  }

  void _callPhoneNumber(String phoneNumber) async {
  final Uri phoneUri = Uri.parse("tel:$phoneNumber");

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Impossible de passer l'appel")),
    );
  }
}

void _openSnapchat(String username) async {
  final Uri snapchatUrl = Uri.parse("https://www.snapchat.com/add/$username");

  if (await canLaunchUrl(snapchatUrl)) {
    await launchUrl(snapchatUrl, mode: LaunchMode.externalApplication);
  } else {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Impossible d'ouvrir Snapchat")),
    );
  }
}

void _openInstagram(String username) async {
  final Uri instagramUrl = Uri.parse("https://www.instagram.com/$username");

  if (await canLaunchUrl(instagramUrl)) {
    await launchUrl(instagramUrl, mode: LaunchMode.externalApplication);
  } else {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Impossible d'ouvrir Instagram")),
    );
  }
}

void _sendEmail(String email) async {
  final Uri emailUrl = Uri.parse("mailto:$email");

  if (await canLaunchUrl(emailUrl)) {
    await launchUrl(emailUrl);
  } else {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Impossible d'envoyer l'email")),
    );
  }
}

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
    
      body: SafeArea(
        child: SingleChildScrollView(
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
                valeur3: "11h - 14h30",
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
        
              DeroulantContact(
                title: "CONTACT HOMMES",
                
                cle: "WhatsApp",
                valeur: "+32 488 396 428", color: Colors.blue, underline: TextDecoration.underline,
                onTapCallback: _openWhatsApp,
        
                cle2: "Téléphone",
                valeur2: "07 67 65 51 48",
                onTapCallback2: _callPhoneNumber,
        
                cle3: "SnapChat",
                valeur3: "terapiya.center",
                onTapCallback3: _openSnapchat,
        
                cle4: "Instagram",
                valeur4: "terapiya.center",
                onTapCallback4: _openInstagram,
        
                cle5: "Mail",
                valeur5: "terapiya.center@gmail.com",
                onTapCallback5: _sendEmail,
              ),
              const SizedBox(height: 5,),
        
              DeroulantContact(
                title: "CONTACT FEMMES",
                cle: "WhatsApp",
                valeur: "+33 07 67 89 66 56", color: Colors.blue, underline: TextDecoration.underline,
                onTapCallback: _openWhatsApp,
        
                cle2: "SnapChat",
                valeur2: "soinlimaa",
                onTapCallback2: _openSnapchat,
        
                cle3: "Instagram",
                valeur3: "soin_lima",
                onTapCallback3: _openInstagram,
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
              ),
              const SizedBox(height: 20),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: 300,
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(50.718445398434305, 3.2378166599461613), // Coordonnées de l'adresse
                      initialZoom: 17.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      const MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(50.718445398434305, 3.2378166599461613), // Coordonnées
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}