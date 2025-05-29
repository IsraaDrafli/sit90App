import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data.dart';
import 'package:google_fonts/google_fonts.dart';

class CalibrationPage extends StatelessWidget {
  CalibrationPage({super.key});
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
              Head('Calibration', () {
                Navigator.pop(context);
              }),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  REcontainer(Color.fromARGB(236, 233, 231, 231), false),
                  Spacer(),
                  REcontainer(Color.fromARGB(236, 233, 231, 231), false),
                  Spacer(),
                  REcontainer(theblue, true),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                'Tweak your sit90',
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Calibrate your  posture to the correct sitting position before use',
                style: GoogleFonts.poppins(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Expanded(child: Obx(() {
                final currentStatus = controller.status.value;
                if (currentStatus == "in_progress") {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(theblue),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Calibrating...',
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ],
                  );
                } else if (currentStatus == "success") {
                  return Icon(
                    Icons.check_circle_rounded,
                    color: Color.fromRGBO(167, 102, 252, 1),
                    size: 150,
                  );
                } else {
                  return Container();
                }
              })),
              Obx(() {
                final currentStatus = controller.status.value;

                String label = '';
                bool isDisabled = false;
                VoidCallback? onPressed;

                if (currentStatus == "in_progress") {
                  label = ". . .";
                  isDisabled = true;
                } else if (currentStatus == "success") {
                  label = "Done";
                  onPressed = () {
                    Navigator.pushNamed(context, '/home');
                  };
                } else {
                  label = '';
                  isDisabled = true;
                }
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Color(0xFFBCEBFF), theblue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // Soft shadow
                            blurRadius: 8,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: isDisabled ? null : onPressed,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.33, 51),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          label,
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CalibrationController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref();
  
  var status = "".obs;

  @override
  void onInit() {
    super.onInit();
    _listenToStatus();
  }

  void _listenToStatus() {
    databaseRef.child('calibration/status').onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        status.value = value.toString();
      } else {
        status.value = "";
      }
    });
  }

  void startCalibration() async {
    await databaseRef.child('commands/calibration').set('start');
  }
}
