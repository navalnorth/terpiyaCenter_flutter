import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RubriqueBoard extends StatelessWidget {
  final String text;
  final Widget destination;
  final Color? bgcolor;
  final Color? textcolor;
  final double width;
  final double height;

  const RubriqueBoard({
    super.key,
    required this.text,
    required this.destination,
    this.bgcolor = const Color.fromARGB(255, 53, 172, 177),
    this.textcolor = Colors.white,
    this.height = 115,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        width: 150,
        height: 115,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: textcolor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
