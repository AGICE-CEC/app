import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(),
            TextField(),
            SizedBox(height: 20),
            OutlinedButton(
              child: Text("Explore!"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/main');
              },
            ),
          ],
        ),
      ),
    );
  }
}
