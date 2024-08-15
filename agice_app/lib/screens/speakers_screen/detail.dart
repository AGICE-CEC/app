import 'package:flutter/material.dart';
import 'host.dart';

class PantallaDetalle extends StatelessWidget {
  final Presentador presentador;

  PantallaDetalle({Key? key, required this.presentador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(presentador.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nombre: ${presentador.nombre}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Hora: ${presentador.hora}'),
            Text('Biografía: ${presentador.biografia}'),
            // Más información
          ],
        ),
      ),
    );
  }
}
