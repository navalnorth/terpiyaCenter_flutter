import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terapiya_center/read%20data/get_user_name.dart';
import 'package:terapiya_center/rubriques/hijama.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 172, 177),
          automaticallyImplyLeading: false,
          title: const GetUserName(),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
              color: Colors.white,
              iconSize: 30,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Hijama",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Auriculothérapie",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Détatouage",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Formations",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Voyages Humanitaires",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Historique des RDV",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Dons personnels",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Hijama()));
                      },

                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 53, 172, 177),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Center(
                          child: Text(
                            "Dons généraux",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                
              ],
            ),
          ),
        )
      ),
    );
  }
}
