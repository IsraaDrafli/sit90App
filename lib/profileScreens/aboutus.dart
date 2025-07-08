import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/data.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientScaffold(
          child: Center(
              child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.5))
            ]),
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width * 0.86,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(isss: 'About Us', img: 'Image/white.png'),
              SizedBox(
                height: 30,
              ),
              logoline(
                taxt: 'is an innovative posture ',
              ),
              Text(
                "monitoring solution designed to help users improve their sitting habits and reduce back pain caused by poor posture.Combining a compact wearable device with a smart mobile application,",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color.fromARGB(255, 7, 7, 7)),
              ),
              logoline(
                taxt: "tracks your posture in real ",
              ),
              Text(
                " time and provides gentle feedback whenever slouching is detected.Whether you're working from home, studying, or spending long hours at your desk, our app encourages healthier posture through awareness and habit-building not just temporary correction.This app was developed as part of an academic project, blending hardware design and modern mobile development to address one of the most common issues in today's sedentary lifestyle.",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color.fromARGB(255, 19, 19, 19)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Have questions, feedback, or need help?',
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color.fromARGB(255, 19, 19, 19)),
              ),
              Text(
                "We'd love to hear from you!",
                style: GoogleFonts.poppins(
                    fontSize: 13, color: const Color.fromARGB(255, 19, 19, 19)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.email_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Email: sit90.team@gmail.com")
                ],
              )
            ],
          ),
        )),
      ))),
    );
  }
}

class logoline extends StatelessWidget {
  final String taxt;
  const logoline({required this.taxt});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Sit',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: const Color.fromARGB(255, 0, 0, 0))),
        Text('90',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.lightBlueAccent)),
        Text(
          taxt,
          style: GoogleFonts.poppins(
              fontSize: 13, color: const Color.fromARGB(255, 19, 19, 19)),
        )
      ],
    );
  }
}
