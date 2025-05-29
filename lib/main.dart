import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sit90/calibration.dart';
import 'package:sit90/charts.dart';
import 'package:sit90/data.dart';
import 'package:sit90/instructions.dart';
import 'package:sit90/pairing.dart';
import 'package:sit90/profileScreens/profilesett.dart';
import 'package:sit90/signup.dart';
import 'package:sit90/start.dart';

import 'login.dart';
import 'profileScreens/aboutus.dart';
import 'profileScreens/helppp.dart';
import 'profileScreens/privacy.dart';

//import 'pairing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyB81-Ngw-DOixiNol-74hsw1BhQZY2v3Zw',
        appId: '1:601599816160:web:21e42cd19d0723290b3b85',
        messagingSenderId: '601599816160',
        projectId: 'sit90-a4cf5',
        authDomain: 'sit90-a4cf5.firebaseapp.com',
        storageBucket: 'sit90-a4cf5.firebasestorage.app',
        databaseURL: 'https://sit90-a4cf5-default-rtdb.firebaseio.com',
      ),
    );
    print("Firebase initialized successfully.");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sit90',
      home: StartPage(),
      routes: {
        '/second': (context) => PairingPage(),
        '/home': (context) => MainPage(),
        '/stat': (context) => ChartsPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/abtus': (context) => AboutUs(),
        '/hlp': (context) => Helpp(),
        '/pr': (context) => Privacy(),
        '/profilesett' : (context) => Profilesett(),
        '/calibration' : (context) => CalibrationPage(),
        '/inst' : (context) => instructionsPage(),
      },
    );
  }
}
