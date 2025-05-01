import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/data.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'Image/START.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'Sit',
                      style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '90',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ])),
                  SizedBox(height: 25),
                  Text(
                    textAlign: TextAlign.center,
                    'You will have everything you need to reach your personal fitness goals - for free!',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Spacer(),
                  SetButton(() {Navigator.pushNamed(context, '/second');}, 'Get started')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
