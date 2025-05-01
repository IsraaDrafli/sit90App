import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:sit90/calibration.dart';
import 'data.dart';

class instructionsPage extends StatelessWidget {
  instructionsPage({super.key});
  final CalibrationController controller = Get.put(CalibrationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 29,
            ),
            Head('Wear it properly', () {
              Navigator.pop(context);
            }),
            SizedBox(
              height: 27,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                REcontainer(Color.fromARGB(236, 233, 231, 231), false),
                Spacer(),
                REcontainer(theblue, true),
                Spacer(),
                REcontainer(Color.fromARGB(236, 233, 231, 231), false),
              ],
            ),
            SizedBox(
              height: 43,
            ),
            Text(
              'Setup your sit90 correctly',
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pic(),
                SizedBox(
                  width: 22,
                ),
                pic(),
                SizedBox(
                  width: 22,
                ),
                pic(),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Instruction('Wrap the band\n around your back',
                      'Make sure it’s snug but\n comfortable'),
                  SizedBox(
                    width: 21,
                  ),
                  Instruction('Center the sensor',
                      'Ensure the sensor is \n centered on your spin\n and facing outwards'),
                  SizedBox(
                    width: 21,
                  ),
                  Instruction('Check fit and\n alignment',
                      'Sit uprigth with feet flat\n and knees at 90*'),
                ],
              ),
            ),
            SetButton(() {
              controller.startCalibration();
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      CalibrationPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }, 'Start Calibration'),
          ],
        ),
      ),
    ));
  }
}

class pic extends StatelessWidget {
  const pic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color.fromARGB(236, 233, 231, 231),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}

class Instruction extends StatelessWidget {
  final String title;
  final String txt;
  const Instruction(this.title, this.txt);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style:
              GoogleFonts.poppins(fontSize: 11.5, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          txt,
          style:
              GoogleFonts.poppins(fontSize: 10.5, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
