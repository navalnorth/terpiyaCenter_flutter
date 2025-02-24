import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/accueil/wrapper.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/input_decoration.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  //text controllers
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  final TextEditingController _mdpConfirmController = TextEditingController();

  String? _errorMessage;

  bool passwordConfirmed() {
    if (_mdpController.text.trim() == _mdpConfirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _mdpController.dispose();
    _mdpConfirmController.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _ageController.dispose();

    super.dispose();
  }

  Future addUserDetails(User user, String prenom, String nom, int age, String email,) async {
    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "prenom": prenom,
      "nom": nom,
      "age": age,
      "email": email,
      "role": "user"
    });
  }

  Future signUp() async {
    setState(() {
      _errorMessage = null;
    });
    try {
      if (!passwordConfirmed()) {
        setState(() {
          _errorMessage = "Les mots de passe ne correspondent pas.";
        });
        return;
      }

      // creation de l'user
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _mdpController.text.trim(),
      );

      User? user = userCredential.user;
      if (user != null) {
        //ajouter les details user dans frestore avec so uid
        await addUserDetails(
          user, 
          _prenomController.text.trim(),
          _nomController.text.trim(),
          int.parse(_ageController.text.trim()),
          _emailController.text.trim(),
        );
      }

      //ramene vers le board
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrapper()));

    } on FirebaseAuthException catch (e) {
      //validation
      setState(() {
        if (e.code == "email-already-in-use") {
          _errorMessage = "Cet e-mail est déjà utilisé.";
        } else if (e.code == "invalid-email") {
          _errorMessage = "L'adresse e-mail est invalide.";
        } else if (e.code == "weak-password") {
          _errorMessage = "Le mot de passe est trop faible.";
        } else {
          _errorMessage = "Une erreur est survenue. Veuillez réessayer.";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        centerTitle: true,
        title: SizedBox(
          height: 100,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Inscription",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 40,),

                  TextFormField(
                    controller: _prenomController,
                    decoration: textInputDecoration("Prénom"),
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _nomController,
                    decoration: textInputDecoration("Nom"),
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _ageController,
                    decoration: textInputDecoration("Age"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20,),
          
                  TextFormField(
                    controller: _emailController,
                    decoration: textInputDecoration("E-mail"),
                  ),
                  const SizedBox(height: 20,),
          
                  TextFormField(
                    controller: _mdpController,
                    decoration: textInputDecoration("Mot de passe"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20,),
          
                  TextFormField(
                    controller: _mdpConfirmController,
                    decoration: textInputDecoration("Confirmer Mot de passe"),
                    obscureText: true,
                  ),
                  const SizedBox(height: 40,),
                  
                  CustomButton(
                      text: "S'inscrire",
                      bgColor: const Color.fromARGB(255, 53, 172, 177),
                      txtColor: Colors.white,
                      borderColor: const Color.fromARGB(255, 53, 172, 177),
                      onPressed: () {
                        signUp();
                      }
                  ),

                  if (_errorMessage != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
