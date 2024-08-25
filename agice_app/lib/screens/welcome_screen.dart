import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> _checkRegistrationStatus(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final registrado = prefs.getBool('isLogin') ?? false;

  if (registrado) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('/main');
  } else {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('/registration');
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      _checkRegistrationStatus(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
