import 'package:flutter/material.dart';
import 'detail.dart';
import 'host.dart';

class PantallaAcordeon extends StatefulWidget {
  @override
  _PantallaAcordeonState createState() => _PantallaAcordeonState();
}

class _PantallaAcordeonState extends State<PantallaAcordeon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presentadores'),
      ),
      body: ListView.builder(
        itemCount: presentadores.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  presentadores[index].hora,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(presentadores[index].nombre),
                subtitle:
                    Text('Descripción: ${presentadores[index].descripcion}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PantallaDetalle(presentador: presentadores[index]),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

// Lista de ejemplo de presentadores
List<Presentador> presentadores = [
  Presentador('Juan Pérez', '10:00 a.m', 'Descripción de Juan...',
      'Biografía de Juan...'),
  Presentador(
      'Ana Gómez', '11:00 p.m', 'Descripción de Ana...', 'Biografía de Ana...'),
  // ...
];
