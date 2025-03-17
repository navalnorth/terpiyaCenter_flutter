import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RubriqueBoard extends StatelessWidget {
  final String text;
  final Widget destination;
  final Color? bgcolor;
  final Color? textcolor;
  final double width;
  final double height;
  final double txtsize;
  final String? path;

  const RubriqueBoard({
    super.key,
    required this.text,
    required this.destination,
    this.bgcolor = const Color.fromARGB(255, 53, 172, 177),
    this.textcolor = Colors.white,
    this.height = 115,
    this.width = 150,
    this.txtsize = 10,
    this.path,
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
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (path != null && path!.isNotEmpty) ...[
                  Image.asset(path!, width: 50, height: 50, color: Colors.white),
                  const SizedBox(height: 10),
                ],

                Text(
                  text.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: textcolor,
                    fontSize: txtsize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
