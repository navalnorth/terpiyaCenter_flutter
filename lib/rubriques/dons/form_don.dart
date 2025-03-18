import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/input_decoration.dart';
import 'package:terapiya_center/user/board.dart';
import 'package:uuid/uuid.dart';

class FormDon extends StatefulWidget {
  final Map<String, int> dons;
  final String modePaiement;
  final String total;

  const FormDon({
    super.key,
    required this.dons,
    required this.modePaiement,
    required this.total,
  });

  @override
  State<FormDon> createState() => _FormDonState();
}

class _FormDonState extends State<FormDon> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _message = TextEditingController();
  final TextEditingController _nom = TextEditingController();
  final TextEditingController _prenom = TextEditingController();
  final TextEditingController _adresse = TextEditingController();
  final TextEditingController _cp = TextEditingController();
  final TextEditingController _commune = TextEditingController();
  final TextEditingController _pays = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _tel = TextEditingController();
  final TextEditingController _paypalEmail = TextEditingController();
  late List<TextEditingController> _controllers;
  final Map<String, String> _nomsDons = {}; // Stocker les noms des dons

  Future<void> _fetchNomDons() async {
    for (var donId in widget.dons.keys) {
      DocumentSnapshot donDoc =
          await FirebaseFirestore.instance.collection("dons").doc(donId).get();

      if (donDoc.exists) {
        _nomsDons[donId] = donDoc['nom'] ?? "Inconnu";
      }
    }

    // Initialiser les contrôleurs après la récupération des noms
    _initializeControllers();
    setState(() {});
  }


  void _initializeControllers() {
    _controllers = widget.dons.entries.expand((entry) {
      return List.generate(entry.value, (index) => TextEditingController());
    }).toList();
  }


  final Uuid uuid = const Uuid();

  Future<void> _enregistrerDon() async {
    if (_formKey.currentState!.validate()) {
      List<Map<String, String>> donInfos = [];
      int controllerIndex = 0;

      for (var entry in widget.dons.entries) {
        String donId = entry.key;
        int quantity = entry.value;
        String nomDon = _nomsDons[donId] ?? "Inconnu";

        for (int i = 0; i < quantity; i++) {
          donInfos.add({
            "id": donId,
            "donId": uuid.v4(), // ✅ Génère un identifiant unique
            "nom": nomDon,
            "beneficiaire": _controllers[controllerIndex++].text.trim(),
          });
        }
      }

      await FirebaseFirestore.instance.collection("donInfos").add({
        "userId": FirebaseAuth.instance.currentUser?.uid,
        "dons": donInfos,
        "message": _message.text.trim(),
        "email": _email.text.trim(),
        "nom": _nom.text.trim(),
        "prenom": _prenom.text.trim(),
        "adresse": _adresse.text.trim(),
        "cp": _cp.text.trim(),
        "commune": _commune.text.trim(),
        "pays": _pays.text.trim(),
        "telephone": _tel.text.trim(),
        "paypalEmail": _paypalEmail.text.trim(),
        "mode_paiement": widget.modePaiement,
        "total": widget.total,
        "date": Timestamp.now(),
      });

      await _envoyerNotificationAdmin();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Informations enregistrées !")));

      Navigator.push(context, MaterialPageRoute(builder: (context) => const Board()));
    }
  }



  Future<void> _envoyerNotificationAdmin() async {
    try {
      // Récupérer les tokens des administrateurs depuis la collection users
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").where("role", isEqualTo: "admin").where("token", isNotEqualTo: null).get();

      List<String> adminTokens = snapshot.docs.map((doc) {
        String token = doc["token"] as String;
        String email = doc["email"] ?? "Email inconnu"; // Affiche l'email de l'admin
        debugPrint("📩 Notification pour : $email | Token : $token");
        return token;
      }).toList();

      if (adminTokens.isEmpty) {
        debugPrint("❌ Aucun admin trouvé pour recevoir la notification.");
        return;
      }

      final response = await http.post(
        Uri.parse("https://sendnotification-hkzyphvo7q-uc.a.run.app"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "tokens": adminTokens,
          "title": "📢 Nouveau don reçu !",
          "body": "Un utilisateur vient d'enregistrer un don.",
          "link": "/admin/dons"
        }),
      );

      if (response.statusCode == 200) {
        debugPrint("✅ Notification envoyée aux admins !");
      } else {
        debugPrint("❌ Erreur d'envoi de la notification : ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Erreur : $e");
    }
  }



  @override
  void initState() {
    super.initState();
    _controllers = [];
    _fetchNomDons();
  }

  @override
  Widget build(BuildContext context) {
    if (_controllers.isEmpty) {
      return const Scaffold(body: Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50)));
    }

    int controllerIndex = 0;

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Informations sur le Don',style: TextStyle(fontSize: 15)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ...widget.dons.entries.expand((entry) {
                    String donId = entry.key;
                    int count = entry.value;
                    String nomDon = _nomsDons[donId] ?? "Chargement...";
                      
                    return List.generate(count, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: _controllers[controllerIndex++],
                          decoration: textInputDecoration(
                            "Nom du bénéficiaire",
                            label: "$nomDon ${count > 1 ? index + 1 : ''}".trim(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Veuillez entrer un nom.";
                            }
                            return null;
                          },
                        ),
                      );
                    });
                  }),
                  const SizedBox(height: 20),

                  if (widget.modePaiement.toLowerCase() == 'paypal') ...[
                    TextFormField(
                      controller: _paypalEmail,
                      decoration: textInputDecoration("Email PayPal", label: "Pseudo ou Email PayPal"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Veuillez entrer un pseudo ou un email PayPal.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],

                  TextFormField(
                    controller: _nom,
                    decoration: textInputDecoration("Habib", label: "Nom"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un nom.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _prenom,
                    decoration: textInputDecoration("Ahmed", label: "Prénom"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un Prénom.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _adresse,
                    decoration: textInputDecoration("29 rue des Roses", label: "Adresse Postale"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un Prénom.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _cp,
                    decoration: textInputDecoration("59000", label: "Code Postale"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un code postale.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _commune,
                    decoration: textInputDecoration("Lille", label: "Commune"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer une ville.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _pays,
                    decoration: textInputDecoration("France", label: "Pays"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un pays.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                      
                  TextFormField(
                    controller: _email,
                    decoration: textInputDecoration("email@exemple.com", label: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un email.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                      
                  TextFormField(
                    controller: _tel,
                    decoration: textInputDecoration("0648394838", label: "Téléphone"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Veuillez entrer un numero de téléphone.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                      
                  TextFormField(
                    controller: _message,
                    decoration: textInputDecoration("Message ou indication", label: "Message"),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),

                  CustomButton(
                    text: "Enregistrer", 
                    borderColor: const Color.fromARGB(255, 53, 172, 177), 
                    bgColor: const Color.fromARGB(255, 53, 172, 177), 
                    txtColor: Colors.white, 
                    onPressed: _enregistrerDon
                  ),
                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
