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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  final TextEditingController _mdpConfirmController = TextEditingController();

  bool passwordConfirmed() {
    if (_mdpController.text.trim() == _mdpConfirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _mdpController.text.trim(),
        );
      }
      
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
    _mdpConfirmController.dispose();

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
                Text(
                  "Inscription",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)
                ),
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
                const SizedBox(height: 20,),

                TextFormField(
                  controller: _mdpConfirmController,
                  decoration: textInputDecoration("Confirmer Mot de passe"),
                  obscureText: true,
                ),
                const SizedBox(height: 50,),
                
                CustomButton(
                    text: "S'inscrire",
                    bgColor: Color.fromARGB(255, 53, 172, 177),
                    txtColor: Colors.white,
                    borderColor: Color.fromARGB(255, 53, 172, 177),
                    onPressed: () {
                      signUp();
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
