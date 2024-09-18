import 'package:flutter/material.dart';
import 'package:messenger/pages/homePage.dart';
import 'pages/splash_page.dart';
import '../services/navigation.dart';
import '../pages/login_page.dart';
import 'package:messenger/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../pages/register.dart';
void main() {
  runApp(SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          MainApp(),
        );
      }));
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider(); // Ensure the instance is returned
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatting',
        theme: ThemeData(
            backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
            scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(112, 112, 115, 1.0))),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => LoginPage(),
          '/register': (BuildContext _context) => RegisterPage(),
          '/home' : (BuildContext _context) => HomePage(),
        },
      ),
    );
  }
}
