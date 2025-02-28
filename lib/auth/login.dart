import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/accueil/wrapper.dart';
import 'package:terapiya_center/auth/mdp_oublie.dart';
import 'package:terapiya_center/auth/register.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/input_decoration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(text: 'nahladelices@gmail.com');
  final TextEditingController _mdpController = TextEditingController(text: 'teclas123');

  bool isLoading = false;
  String? _errorMessage;

  Future<void> saveTokenToDatabase(String userId) async {
    String? token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      // Stocke chaque token dans une collection séparée
      await FirebaseFirestore.instance.collection('tokens').doc(token).set({
        'token': token,
        'userId': userId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> connexionMeth() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }
  
  setState(() {
    isLoading = true;
    _errorMessage = null;
  });

  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _mdpController.text.trim(),
    );

    User? user = userCredential.user;
    if (user != null) {
      await saveTokenToDatabase(user.uid);
    }

    if (!mounted) return;
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Wrapper()));
    
  } on FirebaseAuthException catch (e) {
    setState(() {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        _errorMessage = "Email ou Mot de passe incorrects";
      }
    });
  } finally {
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}


  @override
  void dispose() {
    _emailController.dispose();
    _mdpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 250,
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Connexion",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),

                TextFormField(
                  controller: _emailController,
                  decoration: textInputDecoration("E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre e-mail";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Veuillez entrer un e-mail valide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: _mdpController,
                  decoration: textInputDecoration("Mot de passe"),
                  obscureText: true,
                  
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer votre mot de passe";
                    } else if (value.length < 6) {
                      return "Le mot de passe doit contenir au moins 6 caractères";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MdpOublie()));
                        },
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 53, 172, 177),
                            fontSize: 12
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                isLoading
                    ? const SpinKitChasingDots(color: Color.fromARGB(255, 53, 172, 177), size: 50)
                    : CustomButton(
                        text: "Se connecter",
                        bgColor: const Color.fromARGB(255, 53, 172, 177),
                        txtColor: Colors.white,
                        borderColor: const Color.fromARGB(255, 53, 172, 177),
                        onPressed: () {
                          connexionMeth();
                        }),
                const SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    text: "Pas encore membre ? ",
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "Inscrivez-vous !",
                        style: const TextStyle(color: Color.fromARGB(255, 53, 172, 177)),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                        },
                      ),
                    ],
                  ),
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
    );
  }
}
