import 'package:flutter/material.dart';
import 'acordeon.dart';

class MainSpeakerScreen extends StatelessWidget {
  const MainSpeakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentadores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PantallaAcordeon(),
    );
  }
}
