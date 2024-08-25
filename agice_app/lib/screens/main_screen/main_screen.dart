import 'package:agice_app/screens/speakers_screen/main_speaker_screen.dart';
import 'package:flutter/material.dart';
import '../event_screen/main_event_screen.dart'; 

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MainEventsScreen(), 
    const Center(
      child: Text(
        'Events',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24),
      ),
    ),
    MainSpeakerScreen(),
    const Center(
      child: Text(
        'Maps',
        style: TextStyle(fontSize: 24),
      ),
    ),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
