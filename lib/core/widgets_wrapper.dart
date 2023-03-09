import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:packmore/firebase_options.dart';
import 'package:packmore/core/services/firebase_services.dart';
import 'package:packmore/screens/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:packmore/screens/login_setup/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return const BottomNavigationBarPage();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}

Future<void> initializeApp() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
    GetIt.instance.registerSingleton<FirebaseService>(FirebaseService());
  } catch (e) {
    Fluttertoast.showToast(
      msg: 'Failed to initialize Firebase: $e',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}