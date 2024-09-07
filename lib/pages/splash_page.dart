import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../services/database_service.dart';
import '../services/navigation.dart';
import 'package:get_it/get_it.dart';
import '../services/media_service.dart';
import '../services/cloud_service.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({
    Key? key, // Corrected from 'required key key' to 'Key? key'
    required this.onInitializationComplete,
  }) : super(key: key); // Passing the key to the superclass

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_) {
      _setup().then(
        (_) => widget.onInitializationComplete(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Messenger',
        theme: ThemeData(
            backgroundColor: Color.fromRGBO(246, 246, 246, 1.0),
            scaffoldBackgroundColor: Color.fromRGBO(251, 251, 253, 1.0)),
        home: Scaffold(
          body: Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/images/lg.jpg'), // Add your asset image path here
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(NavigationService());

    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );

    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );

    GetIt.instance.registerSingleton<DatabaseService>(
      DatabaseService(),
    );
  }
}
//2.42 18
