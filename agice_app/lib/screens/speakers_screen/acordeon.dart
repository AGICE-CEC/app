import 'package:agice_app/screens/speakers_screen/detail.dart';
import 'package:agice_app/screens/speakers_screen/host.dart';
import 'package:flutter/material.dart';

class PantallaAcordeon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Presentadores', style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
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
            SizedBox(height: 8.0),
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

class ListaPresentadores extends StatefulWidget {
  final String dia;

  const ListaPresentadores({required this.dia});

  @override
  _ListaPresentadoresState createState() => _ListaPresentadoresState();
}

class _ListaPresentadoresState extends State<ListaPresentadores> {
  List<Presentador> presentadores = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPresentadores();
  }

  Future<void> fetchPresentadores() async {
    try {
      List<Presentador> lista = await Presentador.buildSpeakersList();
      setState(() {
        presentadores = lista.where((p) => p.dia == widget.dia).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Color getTextColorForSalon(String salon) {
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
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final Map<String, List<Presentador>> presentadoresPorHora = {};
    for (var presentador in presentadores) {
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
