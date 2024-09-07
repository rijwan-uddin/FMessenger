import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import '../services/navigation.dart';
void main() {
  runApp(SplashPage(key: UniqueKey(),
      onInitializationComplete: () {
    runApp(MainApp(),);
      }));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatting',
      theme: ThemeData(
          backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(112, 112, 115, 1.0))),
        //navigatorKey: NavigationService.navigatorKey,
    );

  }
}
