import 'package:flutter/material.dart';
import 'core/services/notifiers.dart';
import 'core/routes/router.dart';
import 'core/widget_tree.dart';
import 'core/widgets_wrapper.dart';
import 'core/app_theme_data.dart';
import 'core/routes/my_nav_observer.dart';

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
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(isDark),
          title: 'Pack More',
          home: AuthWrapper(),
          initialRoute: "/",
          onGenerateRoute: generateRoute,
          navigatorObservers: [MyNavigatorObserver()],
        );
      },
    );
  }
}
