import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:terapiya_center/composants/input_decoration.dart';

class ChiffresHumanitaireAdmin extends StatefulWidget {
  const ChiffresHumanitaireAdmin({super.key});

  @override
  State<ChiffresHumanitaireAdmin> createState() => _ChiffresHumanitaireAdminState();
}

class _ChiffresHumanitaireAdminState extends State<ChiffresHumanitaireAdmin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _arbres = TextEditingController();
  final TextEditingController _corans = TextEditingController();
  final TextEditingController _ecole = TextEditingController();
  final TextEditingController _etudiants = TextEditingController();
  final TextEditingController _grandPuits = TextEditingController();
  final TextEditingController _maisons = TextEditingController();
  final TextEditingController _mosquee = TextEditingController();
  final TextEditingController _moutons = TextEditingController();
  final TextEditingController _orphelinat = TextEditingController();
  final TextEditingController _orphelins = TextEditingController();
  final TextEditingController _petitsPuits = TextEditingController();

  late Map<String, dynamic> chiffresHumanitaires = {};

  Future<Map<String, dynamic>> _fetchChiffresHumanitaires () async {
    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('chiffresHumanitaires').doc('KPuKyPiYjBjkDRrB7axJ').get();

    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  Future<void> _updateChiffres(String key, String value) async {
    try {
      await FirebaseFirestore.instance.collection('chiffresHumanitaires').doc('KPuKyPiYjBjkDRrB7axJ').update({key: value});

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Données mises à jour avec succès !')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur')));
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
        title: const Text("Chiffres Humanitaires"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: FutureBuilder<Map<String, dynamic>>(
              future: _fetchChiffresHumanitaires(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: SpinKitChasingDots(color: Colors.brown[200], size: 50));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Aucune donnée trouvée."));
                }
        
                final chiffresHumanitaires = snapshot.data!;
                _arbres.text = chiffresHumanitaires['arbres']?.toString() ?? '1413';
                _corans.text = chiffresHumanitaires['corans']?.toString() ?? '2097';
                _ecole.text = chiffresHumanitaires['ecole']?.toString() ?? '2';
                _etudiants.text = chiffresHumanitaires['etudiants']?.toString() ?? '120';
                _grandPuits.text = chiffresHumanitaires['grandPuits']?.toString() ?? '120';
                _maisons.text = chiffresHumanitaires['maisons']?.toString() ?? '45';
                _mosquee.text = chiffresHumanitaires['mosquee']?.toString() ?? '4';
                _moutons.text = chiffresHumanitaires['moutons']?.toString() ?? '495';
                _orphelinat.text = chiffresHumanitaires['orphelinat']?.toString() ?? '1';
                _orphelins.text = chiffresHumanitaires['orphelins']?.toString() ?? '52';
                _petitsPuits.text = chiffresHumanitaires['petitsPuits']?.toString() ?? '1037';
        
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                    const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _arbres,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Arbres", label: 'Arbres'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("arbres", _arbres.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _corans,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Corans", label: 'Corans'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("corans", _corans.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _ecole,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Ecoles Coranique", label: 'Ecoles Coranique'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("ecole", _ecole.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _etudiants,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Etudiants à charge", label: 'Etudiants à charge'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("etudiants", _etudiants.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _grandPuits,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Grand Puit", label: 'Grand Puit'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("grandPuits", _grandPuits.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _maisons,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Maisons", label: 'Maisons'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("maisons", _maisons.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _mosquee,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Mosquées", label: 'Mosquées'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("mosquee", _mosquee.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _moutons,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Moutons", label: 'Moutons'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("moutons", _moutons.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _orphelinat,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Orphelinat", label: 'Orphelinat'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("orphelinat", _orphelinat.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _orphelins,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Orphelins à charge", label: 'Orphelins à charge'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("orphelins", _orphelins.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
        
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _petitsPuits,
                              keyboardType: TextInputType.number,
                              decoration: textInputDecoration("Petits Puits", label: 'Petits Puits'),
                            ),
                          ),
                          const SizedBox(width: 20,),
        
                          IconButton(
                            onPressed: () async {
                              await _updateChiffres("petitsPuits", _petitsPuits.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.brown[200])
                            ),
                            icon: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white, size: 30)
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  )
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}