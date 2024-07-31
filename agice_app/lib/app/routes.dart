import 'package:flutter/material.dart';
import '../screens/welcome_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/main_screen/main_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const WelcomeScreen(),
    '/registration': (context) => const RegistrationScreen(),
    '/main': (context) => MainScreen(),
  };
}
