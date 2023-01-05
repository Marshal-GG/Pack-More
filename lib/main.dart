import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:packmore/screens/bottom_navigation_bar/body.dart';
import 'package:packmore/screens/main_home_screen/home_screen.dart';
import 'package:packmore/screens/profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'screens/login_setup/welcome/welcome_screen.dart';

//initializing the firebase
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//start of application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pack More',
      home:
          // FutureBuilder(
          //   future: Firebase.initializeApp(
          //     options: DefaultFirebaseOptions.currentPlatform,
          //   ),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return StreamBuilder(
          //         stream: FirebaseAuth.instance.authStateChanges(),
          //         builder: (context, snapshot) {
          //           if (snapshot.hasData) {
          //             return const BottomNavigationBarPage();
          //           } else {
          //             return const WelcomeScreen();
          //           }
          //         },
          //       );
          //     } else {
          //       return const Scaffold(
          //         body: Center(
          //           child: CircularProgressIndicator(),
          //         ),
          //       );
          //     }
          //   },
          // ),
          const BottomNavigationBarPage(),
      //To set default parameters accross the app
      theme: ThemeData(
        // brightness: Brightness.dark,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        //Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: kPrimaryLightColor,
            backgroundColor: kPrimaryColor,
            elevation: 0,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        //Input Field Theme
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
