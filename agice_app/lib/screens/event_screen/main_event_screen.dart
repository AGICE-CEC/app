import 'package:flutter/material.dart';
import 'eventos_screen.dart';

class MainEventsScreen extends StatelessWidget {
  const MainEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EventsPage(),
    );
  }
}
