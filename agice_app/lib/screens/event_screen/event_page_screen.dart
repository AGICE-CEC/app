import 'package:flutter/material.dart';
import 'statement.dart';

class EventPageScreen extends StatefulWidget {
  final int eventId;

  const EventPageScreen({super.key, required this.eventId});

  @override
  // ignore: library_private_types_in_public_api
  _EventPageScreenState createState() => _EventPageScreenState();
}

class _EventPageScreenState extends State<EventPageScreen> {
  late Future<EventDetail> futureEventDetail;

  @override
  void initState() {
    super.initState();
    futureEventDetail = EventData.fetchEventDetail(widget.eventId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Fondo de la pantalla
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Icono para regresar
          onPressed: () {
            Navigator.pop(context); // Acción para regresar a la vista anterior
          },
        ),
      ),
      body: FutureBuilder<EventDetail>(
        future: futureEventDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Event not found'));
          }

          var event = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white),
                    const SizedBox(width: 8.0),
                    Text(
                      '${event.hour}, Día ${event.day}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  event.description,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Impartido por',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: event.speakers.map((speaker) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(speaker.image),
                            radius: 30,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            speaker.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24.0),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade800,
                  ),
                  child: const Center(
                    child: Icon(Icons.map, color: Colors.white, size: 50.0),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.room,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Icon(Icons.help_outline, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
