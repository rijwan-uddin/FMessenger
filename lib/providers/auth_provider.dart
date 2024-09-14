import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:messenger/services/database_service.dart';
import 'package:messenger/services/navigation.dart';



class AuthnticationProvider extends ChangeNotifier{
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;

  AuthenticationProvider(){
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
print('logged in');
      } else {

      }
    });
  }
  Future<void> loginUsingEmailAndPassword(String _email, String _password) async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password);
    }on FirebaseAuthException{
      print('Error login into firebase');
    }catch (e){
      print(e);
    }
  }
}