import 'package:flutter/material.dart';
import 'package:messenger/providers/auth_provider.dart';
import 'package:messenger/services/navigation.dart';
import 'package:messenger/widgets/custom_input_fields.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import '../widgets/rounded_button.dart';
import 'package:messenger/main.dart';
import 'package:messenger/pages/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  late double _deviceHeight;
  late double _deviceWidth;
  late AuthnticationProvider _auth;
  late NavigationService _navigation;
  final _loginFomKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthnticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationService>();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.02),
        height: _deviceHeight * 0.98,
        width: _deviceWidth * 0.97,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(),
            SizedBox(
              height: _deviceHeight * 0.04,
            ),
            _loginForm(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _loginButton(),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            registerAccounLink()
          ],
        ),
      ),
    );
  }

  _pageTitle() {
    return Container(
      height: _deviceHeight * 0.10,
      child: Text(
        'MSN',
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
      ),
    );
  }

  _loginForm() {
    return Container(
      height: _deviceHeight * 0.18,
      child: Form(
        key: _loginFomKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
                onSaved: (_value) {
                  setState(() {
                    _email = _value;
                  });
                },
                regEx: r".{8,}",
                hintText: 'Email',
                obscureText: false),
            CustomTextFormField(
                onSaved: (_value) {
                  setState(() {
                    _password = _value;
                  });
                },
                regEx: r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+$',
                hintText: 'Password',
                obscureText: true),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
      name: 'Login',
      height: _deviceHeight * 0.065,
      width: _deviceWidth * 0.65,
      onPressed: () {
        if (_loginFomKey.currentState!.validate()) {
          _loginFomKey.currentState!.save();
        }
      },
    );
  }

  registerAccounLink() {
    return GestureDetector(
      onTap: () => _navigation.removeAndNavigateToRoute('/register'),
      child: Container(
        child: Text(
          "Don't have an account ?",
          style: TextStyle(
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}
