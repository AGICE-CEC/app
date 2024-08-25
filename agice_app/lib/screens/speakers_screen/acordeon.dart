import 'package:agice_app/screens/speakers_screen/detail.dart';
import 'package:agice_app/screens/speakers_screen/host.dart';
import 'package:flutter/material.dart';

class ListaPresentadores extends StatefulWidget {
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
        presentadores = lista;
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

    return ListView.builder(
      padding: const EdgeInsets.all(12.0), // Añade margen alrededor de la lista
      itemCount: presentadores.length,
      itemBuilder: (context, index) {
        final presentador = presentadores[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.all(0.0), // Sin margen interno para la foto
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(presentador.fotoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      presentador.nombre,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      presentador.descripcion,
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
              ],
            ),
          ),
        );
      },
    );
  }
}

class PantallaPresentadores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Presentadores', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromRGBO(74, 74, 74, 1.0),
      body: ListaPresentadores(),
    );
  }
}
