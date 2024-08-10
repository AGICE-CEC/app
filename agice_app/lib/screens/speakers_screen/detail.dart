import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'host.dart';

class PantallaDetalle extends StatelessWidget {
  final Presentador presentador;

  PantallaDetalle({Key? key, required this.presentador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(presentador.nombre),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[850],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ing. ${presentador.nombre}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Una descripción muy corta.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Trabajo actual',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(presentador.fotoUrl),
            ),
            const SizedBox(height: 24),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              color: Colors.white,
              iconSize: 40,
              onPressed: () {
                // Lógica para abrir el perfil de LinkedIn del presentador
              },
            ),
          ],
        ),
      ),
    );
  }
}
