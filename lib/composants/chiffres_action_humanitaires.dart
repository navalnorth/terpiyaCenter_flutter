import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChiffresActionHumanitaires extends StatelessWidget {
  final String number;
  final String label;
  final double fontSize;
  final double fontSize2;

  const ChiffresActionHumanitaires({
    required this.number, 
    required this.label, 
    this.fontSize = 22,
    this.fontSize2 = 9,
    super.key
  });

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
          Text(
              number,
              style: GoogleFonts.merriweather(fontWeight: FontWeight.bold, fontSize: fontSize)
          ),
          Text(
            label,
            style: TextStyle(fontSize: fontSize2),
          ),
        ],
      ),
    );
  }
}
