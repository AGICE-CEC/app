import 'package:flutter/material.dart';
import 'acordeon.dart';

class MainSpeakerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presentadores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaAcordeon(),
    );
  }
}
