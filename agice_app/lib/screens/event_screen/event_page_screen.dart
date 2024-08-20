import 'package:flutter/material.dart';

class EventPageScreen extends StatelessWidget {
  final Map<String, String> event;

  EventPageScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Fondo de la pantalla
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icono para regresar
          onPressed: () {
            Navigator.pop(context); // Acción para regresar a la vista anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event['title'] ?? 'Nombre de la Actividad',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  '${event['time']}, Martes',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Esta es una breve descripción del evento que se llevará a cabo. Muy útil para dar a entender sobre qué se hablará y qué se puede aprender en él.',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 24.0),
            Text(
              'Impartido por',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade700,
                        radius: 30,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Ing. Nombre\nApellido (1)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade700,
                        radius: 30,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Ing. Nombre\nApellido (2)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade800,
              ),
              child: Center(
                child: Icon(Icons.map, color: Colors.white, size: 50.0),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    event['code'] ?? 'CIT-610',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(Icons.help_outline, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
