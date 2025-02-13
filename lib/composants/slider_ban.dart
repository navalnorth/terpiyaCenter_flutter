import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderItem extends StatelessWidget {
  final String image;
  final String text;
  final double fontSize;

  const SliderItem({
    super.key, 
    required this.image, 
    required this.text,
    this.fontSize = 28
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 53, 172, 177),
                width: 4,
              ),
            ),

            padding: const EdgeInsets.all(0), // Espace entre bordure et image
            child: ClipOval(
              child: Image.asset(
                image, 
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.black, 
                fontSize: fontSize, 
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}
