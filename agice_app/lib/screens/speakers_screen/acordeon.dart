import 'package:agice_app/screens/speakers_screen/detail.dart';
import 'package:agice_app/screens/speakers_screen/host.dart';
import 'package:flutter/material.dart';

class ListaPresentadores extends StatefulWidget {
  const ListaPresentadores({super.key});

  @override
  ListaPresentadoresState createState() => ListaPresentadoresState();
}

class ListaPresentadoresState extends State<ListaPresentadores> {
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
      if (lista.isEmpty) {
        print('No presenters found'); // Debugging log
      } else {
        print('Presenters fetched: ${lista.length}'); // Debugging log
      }
      setState(() {
        presentadores = lista;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching presenters: $e'); // Debugging log
      setState(() {
        isLoading = false;
      });
      // Optionally: Show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Show a message if the list is empty
    if (presentadores.isEmpty) {
      return const Center(
        child: Text(
          'No presenters available at the moment',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: presentadores.length,
      itemBuilder: (context, index) {
        final presentador = presentadores[index];

        // Provide defaults for nullable fields
        final String fotoUrl =
            presentador.fotoUrl ?? ''; // Default to empty string
        final String nombre = presentador.nombre ??
            'Nombre no disponible'; // Default to 'Nombre no disponible'
        final String descripcion = presentador.descripcion ??
            'Sin descripción'; // Default to 'Sin descripción'

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                if (fotoUrl.isNotEmpty)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    ),
                    child: Image.network(
                      fotoUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      nombre,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      descripcion,
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
  const PantallaPresentadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Presentadores', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromRGBO(74, 74, 74, 1.0),
      body: const ListaPresentadores(),
    );
  }
}
