import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sit90/charts.dart';
import 'package:sit90/data.dart';
import 'package:sit90/pairing.dart';
import 'package:sit90/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Future to initialize Firebase
  Future<FirebaseApp> _initializeFirebase() async {
    return await Firebase.initializeApp(
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
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      // Call the initialization function
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        // Check the connection state
        if (snapshot.connectionState == ConnectionState.done) {
          // Firebase is initialized, build the rest of the app
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sit90',
            routes: {
              '/': (context) => StartPage(),
              '/second': (context) => PairingPage(),
              '/home': (context) => MainPage(),
              '/stat': (context) => ChartsPage(),
            },
          );
        }

        // Show a loading indicator while Firebase is initializing
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        // If there was an error initializing Firebase, display an error message
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error initializing Firebase'),
              ),
            ),
          );
        }

        // Default fallback (though this should not be reached)
        return MaterialApp(home: Container());
      },
    );
  }
}
