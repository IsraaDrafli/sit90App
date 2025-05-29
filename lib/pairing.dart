import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:blobs/blobs.dart';
import 'instructions.dart';

import 'data.dart';

final Controller controller = Get.put(Controller());

class PairingPage extends StatelessWidget {
  PairingPage({super.key});
  final PairingController controller = Get.put(PairingController());
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
            Head('Pairing', () {
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
                REcontainer(theblue, true),
                Spacer(),
                REcontainer(Color.fromARGB(236, 233, 231, 231), false),
                Spacer(),
                REcontainer(Color.fromARGB(236, 233, 231, 231), false),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Make sure to enable WiFi to link your device with the app ',
              style: GoogleFonts.poppins(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Blob.animatedRandom(
                    size: 300,
                    edgesCount: 8,
                    minGrowth: 6,
                    loop: true,
                    duration: const Duration(seconds: 2),
                    styles: BlobStyles(
                      color: Colors.lightBlue.withOpacity(0.3),
                    ),
                  ),
                  Blob.animatedRandom(
                    size: 300,
                    edgesCount: 8,
                    minGrowth: 6,
                    loop: true,
                    duration: const Duration(seconds: 2),
                    styles: BlobStyles(
                      color: Colors.lightBlue.withOpacity(0.2),
                    ),
                  ),
                  Blob.animatedRandom(
                    size: 300,
                    edgesCount: 8,
                    minGrowth: 6,
                    loop: true,
                    duration: const Duration(seconds: 2),
                    styles: BlobStyles(
                      color: Colors.lightBlue.withOpacity(0.1),
                    ),
                  ),
                 Obx((){
                  final Status = controller.status.value;
                    if (Status == 'in_progress') {
                      return Text(
                        'Pairing...',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }else{
                      return Text(
                        'Paired!',
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }
                 })
                ],
              ),
            ),
            SetButton(() {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      instructionsPage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }, 'Set'),
          ],
        ),
      ),
    ));
  }
}

class PairingController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref();

  var status = "".obs;

  @override
  void onInit() {
    super.onInit();
    _listenToStatus();
  }

  void _listenToStatus() {
    databaseRef.child('Pairing/status').onValue.listen((event) {
      final value = event.snapshot.value;
      if (value != null) {
        status.value = value.toString();
      } else {
        status.value = "";
      }
    });
  }
}
