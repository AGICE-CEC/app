import 'package:agice_app/screens/speakers_screen/acordeon.dart';
import 'package:flutter/material.dart';

class MainSpeakerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentadores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaPresentadores(),
    );
  }
}
