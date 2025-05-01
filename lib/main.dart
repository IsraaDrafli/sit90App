import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sit90/charts.dart';
import 'package:sit90/data.dart';
import 'package:sit90/pairing.dart';
import 'package:sit90/start.dart';


//import 'pairing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Sit90',
        routes: {
        '/': (context) => StartPage(),
        '/second': (context) => PairingPage(),
        '/home': (context) => MainPage(),
        '/stat': (context) => ChartsPage(),
      },

         );
  }
}
