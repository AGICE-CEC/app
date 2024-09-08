import 'package:flutter/material.dart';
import 'statement.dart';
import 'package:agice_app/screens/speakers_screen/detail.dart';
import 'package:agice_app/screens/speakers_screen/host.dart';
import 'package:agice_app/screens/map_screen.dart'; // Asegúrate de importar MapScreen

class EventPageScreen extends StatefulWidget {
  final int eventId;

  const EventPageScreen({super.key, required this.eventId});

  @override
  _EventPageScreenState createState() => _EventPageScreenState();
}

class _EventPageScreenState extends State<EventPageScreen> {
  late Future<EventDetail> futureEventDetail;

  @override
  void initState() {
    super.initState();
    futureEventDetail = EventData.fetchEventDetail(widget.eventId);
  }

  Color getRoomColor(String room) {
    if (room.startsWith('CIT-1')) {
      return Colors.blue;
    } else if (room.startsWith('CIT-2')) {
      return Colors.green;
    } else if (room.startsWith('CIT-3')) {
      return Colors.red;
    } else if (room.startsWith('CIT-4')) {
      return Colors.orange;
    } else if (room.startsWith('CIT-5')) {
      return Colors.yellow;
    } else if (room.startsWith('CIT-6')) {
      return Colors.teal;
    } else if (room.startsWith('CIT-7')) {
      return Colors.purple;
    } else {
      return Colors.grey;
    }
  }

  Presentador convertSpeakerToPresentador(Speaker speaker) {
    return Presentador(
      nombre: speaker.name,
      pais: "",
      descripcion: "",
      contacto: "",
      fotoUrl: speaker.image,
      linkedinUrl: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Background color of the screen
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme:
            const IconThemeData(color: Colors.white), // Set all icons to white
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Icon to go back
          onPressed: () {
            Navigator.pop(context); // Action to go back to the previous screen
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
                // Event title
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Event time and day
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
                // Event description
                Text(
                  event.description,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 24.0),
                // Section for speakers
                const Text(
                  'Impartido por',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Speakers list with navigation
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: event.speakers.map((speaker) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PantallaDetalle(
                                    presentador:
                                        convertSpeakerToPresentador(speaker)),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 120,
                            child: Column(
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
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                // Map or image related to the event
                Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade800,
                  ),
                  child: MapScreen(
                      location: event
                          .location.description), // Aquí se pasa la ubicación
                ),
                const Spacer(),
                // Button to show event room or related information
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: getRoomColor(
                        event.room), // Apply the dynamic color here
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.room,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
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
