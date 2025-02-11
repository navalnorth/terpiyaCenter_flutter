import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:terapiya_center/auth/login.dart';
import 'package:terapiya_center/auth/register.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/slider_ban.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        centerTitle: true,
        title: SizedBox(
          height: 70,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Bienvenue ! \nTerapiya Center c'est :",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 20,),

            SizedBox(
              height: 400,
              child: PageView(
                controller: _pageController,
                children: const [
                  SliderItem(
                    image: "assets/slide/slide1.png",
                    text: "🤗 Des dons et des actions humaniaires 🤗",
                    fontSize: 20,
                  ),
                  SliderItem(
                      image: "assets/slide/slide2.png",
                      text: "🚀 Des prises de rendez-vous pour votre bien-être 🚀",
                      fontSize: 20,
                    ),
                  SliderItem(
                      image: "assets/slide/slide3.png",
                      text: "⚕️ Des Formations bien-être à vous proposer ⚕️",
                      fontSize: 20,
                  ),
                ],
              ),
            ),
        
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.black,
                  dotHeight: 6,
                  dotWidth: 6,
                  expansionFactor: 2,
                  spacing: 4,
                ),
              ),
            ),
            SizedBox(height: 50),
        
            Center(
              child: CustomButton(
                    text: "Se connecter", 
                    bgColor: Color.fromARGB(255, 53, 172, 177),
                    txtColor: Colors.white,
                    borderColor: Color.fromARGB(255, 53, 172, 177),
                    paddingHorizontal: 14,
                    fontSize: 16,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    }
                  ),
            ),
            SizedBox(height: 14),
        
            Center(
              child: CustomButton(
                    text: "S'inscrire", 
                    bgColor: Colors.white,
                    txtColor: Color.fromARGB(255, 53, 172, 177),
                    borderColor: Color.fromARGB(255, 53, 172, 177),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                    }
                  ),
            ),
            const SizedBox(height: 15),
        
          ],
        ),
      ),
    );
  }
}
