import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/data.dart';
import 'package:sit90/login.dart' show LoginPage;
import 'package:sit90/pairing.dart' show PairingPage;

import 'calibration.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});
  final CalibrationController controller = Get.put(CalibrationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'Image/Startbg.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                    Text(
                      textAlign: TextAlign.center,
                      'Daily support for lifelong posture health',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Spacer(),
                    SetButton(() async {
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        // User is logged in
                      final currentStatus = controller.status.value;
                      if(currentStatus == "success"){
                         Navigator.pushNamed(context, '/home');
                      }else{
                        Navigator.pushNamed(context, '/second');
                      }
                      } else {
                        // User is not logged in
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      }
                    }, 'Get started')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
