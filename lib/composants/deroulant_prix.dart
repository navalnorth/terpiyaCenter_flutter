import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeroulantPrix extends StatefulWidget {
  final String title;
  final String? prix;
  final String? introText;
  final String? introText2;
  final String? introText3;
  final String? introText4;
  final String? introText5;
  final String? introText6;
  final String? introText7;
  final String? introText8;
  final String? introText9;
  final String? introText10;
  final String? introText11;

  const DeroulantPrix({
    super.key,
    required this.title,
    this.prix,
    this.introText,
    this.introText2,
    this.introText3,
    this.introText4,
    this.introText5,
    this.introText6,
    this.introText7,
    this.introText8,
    this.introText9,
    this.introText10,
    this.introText11,
  });

  @override
  DeroulantPrixState createState() => DeroulantPrixState();
}

class DeroulantPrixState extends State<DeroulantPrix> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 53, 172, 177),
            width: 2,
          ),
        ),

        child: ExpansionTile(
          shape: const Border(),
          title: Text(
            widget.title,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: Colors.black,
          ),

          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.prix != null) ...[
                    Text(
                      widget.prix!,
                      style:
                          GoogleFonts.merriweather(
                            fontWeight: FontWeight.w500, 
                            color: const Color.fromARGB(255, 53, 172, 177),
                            fontSize: 25
                          ),
                          textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                  ],

                  if (widget.introText != null) ...[
                    Text(
                      widget.introText!,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500
                          ),
                        textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                  ],

                  if (widget.introText2 != null) ...[
                    Text(
                      widget.introText2!,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                  ],

                  if (widget.introText3 != null) ...[
                    Text(
                      widget.introText3!,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                  ],

                  if (widget.introText4 != null) ...[
                    Text(
                      widget.introText4!,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                  ],

                  if (widget.introText5 != null) ...[
                    Text(
                      widget.introText5!,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                  ],

                  if (widget.introText6 != null) ...[
                    Text(
                      widget.introText6!,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                  ],

                  if (widget.introText7 != null) ...[
                    Text(
                      widget.introText7!,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],

                  if (widget.introText8 != null) ...[
                    Text(
                      widget.introText8!,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],

                  if (widget.introText9 != null) ...[
                    Text(
                      widget.introText9!,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],

                  if (widget.introText10 != null) ...[
                    Text(
                      widget.introText10!,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],

                  if (widget.introText11 != null) ...[
                    Text(
                      widget.introText11!,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
