import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeroulantContact extends StatefulWidget {
  final String title;
  final String? cle;
  final String? cle2;
  final String? cle3;
  final String? cle4;
  final String? cle5;
  final String? valeur;
  final String? valeur2;
  final String? valeur3;
  final String? valeur4;
  final String? valeur5;
  final Color? color;
  final TextDecoration? underline;
  final void Function(String)? onTapCallback;
  final void Function(String)? onTapCallback2;
  final void Function(String)? onTapCallback3;
  final void Function(String)? onTapCallback4;
  final void Function(String)? onTapCallback5;

  const DeroulantContact({
    super.key,
    required this.title,
    this.cle,
    this.cle2,
    this.cle3,
    this.cle4,
    this.cle5,
    this.valeur,
    this.valeur2,
    this.valeur3,
    this.valeur4,
    this.valeur5,
    this.color,
    this.underline,
    this.onTapCallback,
    this.onTapCallback2,
    this.onTapCallback3,
    this.onTapCallback4,
    this.onTapCallback5,
  });

  @override
  DeroulantContactState createState() => DeroulantContactState();
}

class DeroulantContactState extends State<DeroulantContact> {
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.cle != null) ...[
                        Text(
                          widget.cle!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],

                      const Spacer(),

                      if (widget.valeur != null) ...[
                        GestureDetector(
                          onTap: () {
                            if (widget.onTapCallback != null) {
                              widget.onTapCallback!(widget.valeur!);
                            }
                          },
                          child: Text(
                            widget.valeur!,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: widget.color,
                              decoration: widget.underline,
                              decorationColor: widget.color
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.cle2 != null) ...[
                        Text(
                          widget.cle2!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],

                      const Spacer(),
                      
                      if (widget.valeur2 != null) ...[
                        GestureDetector(
                          onTap: () {
                            if (widget.onTapCallback2 != null) {
                              widget.onTapCallback2!(widget.valeur2!);
                            }
                          },
                          child: Text(
                            widget.valeur2!,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: widget.color,
                              decoration: widget.underline,
                              decorationColor: widget.color
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.cle3 != null) ...[
                        Text(
                          widget.cle3!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],

                      const Spacer(),
                      
                      if (widget.valeur3 != null) ...[
                        GestureDetector(
                          onTap: () {
                            if (widget.onTapCallback3 != null) {
                              widget.onTapCallback3!(widget.valeur3!);
                            }
                          },
                          child: Text(
                            widget.valeur3!,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: widget.color,
                              decoration: widget.underline,
                              decorationColor: widget.color
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.cle4 != null) ...[
                        Text(
                          widget.cle4!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],

                      const Spacer(),
                      
                      if (widget.valeur4 != null) ...[
                        GestureDetector(
                          onTap: () {
                            if (widget.onTapCallback4 != null) {
                              widget.onTapCallback4!(widget.valeur4!);
                            }
                          },
                          child: Text(
                            widget.valeur4!,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: widget.color,
                              decoration: widget.underline,
                              decorationColor: widget.color
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.cle5 != null) ...[
                        Text(
                          widget.cle5!,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],

                      const Spacer(),
                      
                      if (widget.valeur5 != null) ...[
                        GestureDetector(
                          onTap: () {
                            if (widget.onTapCallback5 != null) {
                              widget.onTapCallback5!(widget.valeur5!);
                            }
                          },
                          child: Text(
                            widget.valeur5!,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: widget.color,
                              decoration: widget.underline,
                              decorationColor: widget.color
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (widget.cle5 != null) const SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
