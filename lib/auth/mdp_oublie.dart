import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/input_decoration.dart';

class MdpOublie extends StatefulWidget {
  const MdpOublie({super.key});

  @override
  State<MdpOublie> createState() => _MdpOublieState();
}

class _MdpOublieState extends State<MdpOublie> {
  final TextEditingController _emailController = TextEditingController();

  String _message = '';
  Color _messageColor = Colors.green;

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      setState(() {
        _message =
            "Si l'e-mail est inscrit, un lien de réinitialisation a été envoyé.";
        _messageColor = Colors.green;
      });
    } on FirebaseAuthException catch (_) {
      setState(() {
        _message = "Erreur lors de la réinitialisation du mot de passe";
        _messageColor = Colors.red;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 200,
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
          child: Column(
            children: [
              const Text(
                "Réinitialiser \n mot de passe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Entrez votre email et vous recevrez un lien pour la réinitialisation.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: textInputDecoration("E-mail"),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Réinitialiser",
                borderColor: const Color.fromARGB(255, 53, 172, 177),
                bgColor: const Color.fromARGB(255, 53, 172, 177),
                txtColor: Colors.white,
                onPressed: passwordReset,
              ),
              const SizedBox(height: 10),
              Text(
                _message,
                style: TextStyle(
                    color: _messageColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
