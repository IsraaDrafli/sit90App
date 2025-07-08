import 'package:flutter/material.dart';
import 'package:sit90/data.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topBar(isss: 'Privacy', img: 'Image/white.png'),
                SizedBox(
                  height: 25,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Text(
                          'Your privacy matters to us.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Sit90 uses sensor data from your posture correction device '
                          'to monitor and improve your sitting habits. Here\'s how we handle your data:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '• What We Collect:\n'
                          '  Posture-related sensor data (e.g., body angle, movement patterns).\n\n'
                          '• Why We Collect It:\n'
                          '  To detect poor posture and send real-time feedback.\n\n'
                          '• How It’s Stored:\n'
                          '  Securely in Firebase and not shared with third parties.\n\n'
                          '• Your Control:\n'
                          '  You can delete your data anytime from the settings.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )),
      ))),
    );
  }
}
