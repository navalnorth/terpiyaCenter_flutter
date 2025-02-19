import 'package:flutter/material.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/user/board.dart';
import 'package:intl/intl.dart';

class ConfirmationRdv extends StatelessWidget {
  final String date;
  final String time;
  final String gender;
  final String therapie;

  const ConfirmationRdv({
    super.key,
    required this.date,
    required this.time,
    required this.gender,
    required this.therapie,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(date));

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Confirmation RDV"),
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          foregroundColor: Colors.white,
        ),
      
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 100),
                const SizedBox(height: 20),
            
                const Text(
                  "Votre rendez-vous est confirmé !",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
            
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("📅 Date : $formattedDate", style: const TextStyle(fontSize: 18)),
                        Text("⏰ Heure : $time", style: const TextStyle(fontSize: 18)),
                        Text("👤 Genre : $gender", style: const TextStyle(fontSize: 18)),
                        Text("💆‍♂️ Thérapie : $therapie", style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                CustomButton(
                  text: "Retour à l'accueil", 
                  borderColor: const Color.fromARGB(255, 53, 172, 177), 
                  bgColor: const Color.fromARGB(255, 53, 172, 177), 
                  txtColor: Colors.white, 
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Board()));
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
