import 'package:flutter/material.dart';
import 'package:packmore/master_components/routes/router.dart';
import 'package:packmore/master_components/widgets_wrapper.dart';
import 'master_components/app_theme_data.dart';
import 'master_components/routes/my_nav_observer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize app from different file
  await initializeApp();
  runApp(const MyApp());
}

//start of application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Pack More',
      home: AuthWrapper(),
      // const WelcomeScreen(),
      // const BottomNavigationBarPage(),
      initialRoute: "/",
      onGenerateRoute: generateRoute,
      navigatorObservers: [MyNavigatorObserver()],
    );
  }
}
