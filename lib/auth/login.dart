import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/accueil/wrapper.dart';
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

  //text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();

  Future connexionMeth() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _mdpController.text.trim(),
      );
      
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Wrapper()));

    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        "Utilisateur non trouvé.";
      } else if (e.code == "wrong-password") {
        "Mot de passe incorrect.";
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
          height: 70,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
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
                const SizedBox(height: 40,),

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
                const SizedBox(height: 50,),
                
                CustomButton(
                    text: "Se connecter",
                    bgColor: Color.fromARGB(255, 53, 172, 177),
                    txtColor: Colors.white,
                    borderColor: Color.fromARGB(255, 53, 172, 177),
                    onPressed: () {
                      connexionMeth();
                    }),
                const SizedBox(height: 15,),

                RichText(
                  text: TextSpan(
                    text: "Pas encore membre ? ",
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "Inscrivez-vous !",
                        style: const TextStyle(color: Color.fromARGB(255, 53, 172, 177)),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
