import 'package:agice_app/screens/speakers_screen/detail.dart';
import 'package:agice_app/screens/speakers_screen/host.dart';
import 'package:flutter/material.dart';

class PantallaAcordeon extends StatelessWidget {
  const PantallaAcordeon({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Tres pestañas para tres días
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Presentadores',
              style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            labelColor: Colors.white, // Color de los tabs activos
            unselectedLabelColor: Colors.grey, // Color de los tabs inactivos
            indicatorColor: Colors.white, // Color del indicador debajo del tab
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold, // Poner el texto en negrita
            ),
            tabs: [
              Tab(text: 'Día 1'),
              Tab(text: 'Día 2'),
              Tab(text: 'Día 3'),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(74, 74, 74, 1.0),
        body: const Column(
          children: [
            SizedBox(height: 8.0), // Espacio entre TabBar y contenido
            Expanded(
              child: TabBarView(
                children: [
                  ListaPresentadores(dia: 'Día 1'),
                  ListaPresentadores(dia: 'Día 2'),
                  ListaPresentadores(dia: 'Día 3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaPresentadores extends StatelessWidget {
  final String dia;

  const ListaPresentadores({super.key, required this.dia});

  // Función para determinar el color del texto según el número del salón
  Color getTextColorForSalon(String salon) {
    // Extraer el número del salón
    final salonNumber = int.tryParse(salon.split('-')[1]) ?? 0;
    switch (salonNumber.toString()[0]) {
      case '1':
        return const Color.fromRGBO(23, 122, 194, 1.0);
      case '2':
        return const Color.fromRGBO(42, 167, 31, 1.0);
      case '3':
        return const Color.fromRGBO(206, 44, 44, 1.0);
      case '4':
        return const Color.fromRGBO(247, 125, 40, 1.0);
      case '5':
        return const Color.fromRGBO(254, 180, 25, 1.0);
      case '6':
        return const Color.fromRGBO(19, 150, 158, 1.0);
      case '7':
        return const Color.fromRGBO(134, 42, 132, 1.0);
      default:
        return Colors
            .black; // Color por defecto si el número no está en el rango de 1 a 7
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar los presentadores según el día
    final List<Presentador> presentadoresDelDia =
        presentadores.where((p) => p.dia == dia).toList();

    // Agrupar los presentadores por hora
    final Map<String, List<Presentador>> presentadoresPorHora = {};
    for (var presentador in presentadoresDelDia) {
      if (presentadoresPorHora.containsKey(presentador.hora)) {
        presentadoresPorHora[presentador.hora]!.add(presentador);
      } else {
        presentadoresPorHora[presentador.hora] = [presentador];
      }
    }

    return ListView(
      children: presentadoresPorHora.keys.map((hora) {
        final list = presentadoresPorHora[hora]!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hora,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ...list.map((presentador) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        title: Text(
                          presentador.nombre,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Descripción: ${presentador.descripcion}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PantallaDetalle(presentador: presentador),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          color: Colors.white,
                          child: Text(
                            presentador.salon,
                            style: TextStyle(
                                color: getTextColorForSalon(presentador.salon)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      }).toList(),
    );
  }
}

List<Presentador> presentadores = [
  Presentador(
    nombre: 'Juan Pérez',
    hora: '9:00 a.m',
    descripcion: 'Descripción de Juan...',
    biografia: 'Biografía de Juan...',
    dia: 'Día 1',
    salon: 'CIT-123',
    fotoUrl: 'https://example.com/juan.jpg',
    trabajoActual: 'Ingeniero de Software',
    linkedinUrl: 'https://linkedin.com/in/juanperez',
  ),
  Presentador(
    nombre: 'Ana Gómez 2',
    hora: '9:00 a.m',
    descripcion: 'Descripción de Ana...',
    biografia: 'Biografía de Ana...',
    dia: 'Día 2',
    salon: 'CIT-256',
    fotoUrl: 'https://example.com/ana.jpg',
    trabajoActual: 'Consultora',
    linkedinUrl: 'https://linkedin.com/in/anagomez',
  ),
  Presentador(
    nombre: 'Ana Gómez',
    hora: '9:00 a.m',
    descripcion: 'Descripción de Ana...',
    biografia: 'Biografía de Ana...',
    dia: 'Día 1',
    salon: 'CIT-356',
    fotoUrl: 'https://example.com/ana.jpg',
    trabajoActual: 'Consultora',
    linkedinUrl: 'https://linkedin.com/in/anagomez',
  ),
  Presentador(
    nombre: 'Juan Pérez',
    hora: '10:00 a.m',
    descripcion: 'Descripción de Juan...',
    biografia: 'Biografía de Juan...',
    dia: 'Día 1',
    salon: 'CIT-423',
    fotoUrl: 'https://example.com/juan.jpg',
    trabajoActual: 'Ingeniero de Software',
    linkedinUrl: 'https://linkedin.com/in/juanperez',
  ),
  Presentador(
    nombre: 'Ana Gómez 2',
    hora: '10:00 a.m',
    descripcion: 'Descripción de Ana...',
    biografia: 'Biografía de Ana...',
    dia: 'Día 1',
    salon: 'CIT-556',
    fotoUrl: 'https://example.com/ana.jpg',
    trabajoActual: 'Consultora',
    linkedinUrl: 'https://linkedin.com/in/anagomez',
  ),
  Presentador(
    nombre: 'Ana Gómez',
    hora: '11:00 p.m',
    descripcion: 'Descripción de Ana...',
    biografia: 'Biografía de Ana...',
    dia: 'Día 1',
    salon: 'CIT-656',
    fotoUrl: 'https://example.com/ana.jpg',
    trabajoActual: 'Consultora',
    linkedinUrl: 'https://linkedin.com/in/anagomez',
  ),
  Presentador(
    nombre: 'Ana Gómez',
    hora: '12:00 p.m',
    descripcion: 'Descripción de Ana...',
    biografia: 'Biografía de Ana...',
    dia: 'Día 1',
    salon: 'CIT-756',
    fotoUrl: 'https://example.com/ana.jpg',
    trabajoActual: 'Consultora',
    linkedinUrl: 'https://linkedin.com/in/anagomez',
  ),
  // ...
];
