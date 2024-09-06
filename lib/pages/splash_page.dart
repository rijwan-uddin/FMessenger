import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    _setup().then(
      (_) => widget.onInitializationComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Messenger',
        theme: ThemeData(
            backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
            scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0)),
        home: Scaffold(
          body: Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                      'assets/images/sp.jpg'), // Add your asset image path here
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
    GetIt.instance.registerSingleton<NavigationService>(
        NavigationService()
    );

    GetIt.instance.registerSingleton<MediaService>(
      MediaService(),
    );

    GetIt.instance.registerSingleton<CloudStorageService>(
      CloudStorageService(),
    );
  }
}
