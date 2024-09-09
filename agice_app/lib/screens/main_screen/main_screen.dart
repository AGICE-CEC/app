import 'package:agice_app/screens/event_screen/eventos_screen.dart';
import 'package:agice_app/screens/faq_screen/faq.dart';
import 'package:agice_app/screens/map_screen.dart';
import 'package:agice_app/screens/speakers_screen/acordeon.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

Future<void> _checkRegistrationStatus(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final registrado = prefs.getBool('isLogin') ?? false;

  if (!registrado) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('/registration');
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      _checkRegistrationStatus(context);
    });
  }

  final List<Widget> _pages = [
    const EventsPage(),
    const PantallaPresentadores(),
    const MapScreen(showMessage: true),
    const FAQPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Speakers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'FAQ',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue[800],
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }
}
