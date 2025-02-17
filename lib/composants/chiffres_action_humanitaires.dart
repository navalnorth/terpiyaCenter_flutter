import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChiffresActionHumanitaires extends StatelessWidget {
  final String number;
  final String label;

  const ChiffresActionHumanitaires(
      {required this.number, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 53, 172, 177),
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        children: [
          Text(number,
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold, fontSize: 22)),
          Text(
            label,
            style: const TextStyle(fontSize: 9),
          ),
        ],
      ),
    );
  }
}
