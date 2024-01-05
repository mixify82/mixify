import 'package:flutter/material.dart';
import 'home.dart';
import 'first_screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAQouVl3qWUmQSG8SyBQf432pLw1ljPpJo",
          authDomain: "mixify-eec5d.firebaseapp.com",
          projectId: "mixify-eec5d",
          storageBucket: "mixify-eec5d.appspot.com",
          messagingSenderId: "704726820236",
          appId: "1:704726820236:web:e1a6572a087a6b0cf8e2a9"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MaterialApp(
    title: "Mixify: Music, Movies & Magic",
    debugShowCheckedModeBanner: false,
    home: SignInScreen(),
  ));
}

