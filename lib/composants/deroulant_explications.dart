import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeroulantExplications extends StatefulWidget {
  final String title;
  final String? introText;
  final String? introText2;
  final List<String>? content;

  const DeroulantExplications({
    super.key,
    required this.title,
    this.introText,
    this.introText2,
    this.content,
  });

  @override
  DeroulantExplicationsState createState() => DeroulantExplicationsState();
}

class DeroulantExplicationsState extends State<DeroulantExplications> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.introText != null) ...[
                    Text(
                      widget.introText!,
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                  ],

                  if (widget.content != null && widget.content!.isNotEmpty) ...[
                    ...widget.content!.map((item) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text("\u2022 $item"),
                        )),
                  ],

                  if (widget.introText2 != null) ...[
                    Text(
                      widget.introText2!,
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
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
