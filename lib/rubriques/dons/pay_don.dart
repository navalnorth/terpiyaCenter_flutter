import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:terapiya_center/rubriques/dons/form_don.dart';
import 'package:terapiya_center/user/board.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PayDon extends StatefulWidget {
  const PayDon({super.key});

  @override
  State<PayDon> createState() => _PayDonState();
}

class _PayDonState extends State<PayDon> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _donTotal = TextEditingController(text: "0.00€");

  final Map<String, int> _quantites = {};
  final Map<String, double> _prixDon = {};
  String? _modePaiement;



  void _updateQuantite(String donId, int delta) {
    setState(() {
      _quantites[donId] = (_quantites[donId] ?? 0) + delta;
      if (_quantites[donId]! < 0) {
        _quantites[donId] = 0;
      }
      _calculerTotal();
    });
  }



  void _calculerTotal() {
    double total = 0.0;
    _quantites.forEach((donId, quantitte) {
      total += (quantitte * (_prixDon[donId] ?? 0));
    });
    _donTotal.text = "${total.toStringAsFixed(2)}€";
  }



  Future<void> _cbPayment() async {
    try {
      double montant = double.parse(_donTotal.text.replaceAll('€', '').trim()) * 100;

      final response = await http.post(
        Uri.parse("https://us-central1-terpaiyacenter.cloudfunctions.net/createPaymentIntent"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'amount': montant.toInt(), 'currency':'eur'})
      );
      final paymentIntentData = json.decode(response.body);

      await stripe.Stripe.instance.initPaymentSheet(
        paymentSheetParameters: stripe.SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          merchantDisplayName: 'Mon Organisation'
        )
      );

      if (paymentIntentData['status'] != 'requires_payment_method') {
        throw Exception("Paiement non valide !");
      }

      await stripe.Stripe.instance.presentPaymentSheet();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Paiemet réussi !")));

      await _enregistrerDon();
    } catch (e) {
      if (e is stripe.StripeException) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("❌ Paiement annulé ou échoué ")));
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("❌ Erreur de paiement")));
      }
    }
  }



  Future<void> _openPayPal() async {
    String montant = _donTotal.text.replaceAll('€', '').trim();
    if (montant == '0.00' || montant.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez sélectioner un montant valide")));
      return;
    }

    final Uri paypalUrl = Uri.parse("https://www.paypal.me/TerapiyaCenter/$montant");

    try {
      if (await canLaunchUrl(paypalUrl)) {
        await launchUrl(paypalUrl, mode: LaunchMode.externalApplication);
      } else {
        throw Exception("Impossible d'ouvrir Paypal");
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erreur lors de l'ouverture de PayPal.")));
    }

    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Board()));
  }



  Future<void> _soumettre() async {
    if (_formKey.currentState!.validate()) {
      if (_donTotal.text == "0.00€") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez sélectionner au moins un don.")));
        return;
      }

      if (_modePaiement == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez sélectionner un mode de paiement.")));
        return;
      }

      if (_modePaiement == "CB") {
        await _cbPayment();
      } else if (_modePaiement == "PayPal") {
        await _openPayPal();
      } else if (_modePaiement == "Espèces") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Board()));
      }
    }
  }



  Future<void> _enregistrerDon() async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, int> donsSelectionnes = _quantites.entries.where((entry) => entry.value > 0).fold({}, (map, entry) {
      map[entry.key] = entry.value;
      return map;
    });

    if (donsSelectionnes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Veuillez sélectionner au moins un don.")));
      return;
    }

    // 🔥 Enregistrer dans Firestore (collection "transactions_dons")
    await FirebaseFirestore.instance.collection("transactions_dons").add({
      "userId": user!.uid,
      "dons": donsSelectionnes,
      'total': _donTotal.text,
      "mode_paiement": _modePaiement,
      "date": Timestamp.now(),
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Don enregistré avec succès !")));

    setState(() {
      _quantites.clear();
      _prixDon.clear();
      _donTotal.text = "0.00€";
      _modePaiement = null;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => FormDon(dons: donsSelectionnes)));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAIRE UN DON', style: TextStyle(fontSize: 15)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('dons').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177),size: 50));
                      }
                
                      var dons = snapshot.data!.docs;
                      if (_prixDon.isEmpty) {
                        for (var don in dons) {
                          _prixDon[don.id] = don['prix'].toDouble();
                        }
                      }
                      return ListView.builder(
                        itemCount: dons.length,
                        itemBuilder: (context, index) {
                          var don = dons[index];
                          String donId = don.id;
                          String nom = don['nom'];
                          double prix = don['prix'].toDouble();
                
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( nom, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      Text("$prix€",style: TextStyle(color: Colors.grey[700])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => _updateQuantite(donId, -1),
                                        icon: const Icon(Icons.remove, color: Colors.red),
                                      ),
                                      Text("${_quantites[donId] ?? 0}",style: const TextStyle(fontSize: 18)),
                                      IconButton(
                                        onPressed: () => _updateQuantite(donId, 1),
                                        icon: const Icon(Icons.add, color: Colors.green),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: _donTotal,
                  decoration: const InputDecoration(
                    labelText: "Total des dons :",
                    hintText: "0.00€",
                  ),
                  readOnly: true,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
                ),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text("Mode de paiement :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Radio<String>(
                              value: "CB",
                              groupValue: _modePaiement,
                              onChanged: (value) {
                                setState(() {
                                  _modePaiement = value;
                                });
                              },
                            ),
                            const Text("CB"),

                            Radio<String>(
                              value: "PayPal",
                              groupValue: _modePaiement,
                              onChanged: (value) {
                                setState(() {
                                  _modePaiement = value;
                                });
                              },
                            ),
                            const Text("PayPal"),

                            Radio<String>(
                              value: "Espèces",
                              groupValue: _modePaiement,
                              onChanged: (value) {
                                setState(() {
                                  _modePaiement = value;
                                });
                              },
                            ),
                            const Text("Espèces"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10,),

                Visibility(
                  visible: _modePaiement == 'CB',
                  child: const Text(
                    "Après avoir payé en CB vous serez rediriger pour remplir les infos du don 😊",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  )
                ),

                Visibility(
                  visible: _modePaiement == 'PayPal',
                  child: const Text(
                    "⚠️ Vous serez redirigés vers notre PayPal pour faire le don, VEUILLEZ PAYER EN PROCHES SINON VOTRE DON SERA REMBOURSE ! Si vous faites plusiers dons veuillez détailler chaque don avec: type de don et au nom de qui 😊",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  )
                ),

                Visibility(
                  visible: _modePaiement == 'Espèces',
                  child: const Text(
                    "Pour les dons en espèces, venez déposez votre don au cabinet au 119 Rue des Croisiers à Mouscron 😊",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  )
                ),

                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: _soumettre,
                  child: const Text("Soumettre"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
