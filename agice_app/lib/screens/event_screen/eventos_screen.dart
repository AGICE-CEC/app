import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> events = {
    'Día 1': [
      {'time': '10:00 am', 'title': 'Título del Evento en 2 líneas al menos como max', 'code': 'CIT-710'},
      {'time': '10:40 am', 'title': 'Título del Evento en 2 líneas al menos como max', 'code': 'CIT-610'},
      {'time': '10:40 am', 'title': 'Título del Evento en 2 líneas al menos como max', 'code': 'CIT-310'},
      {'time': '11:20 am', 'title': 'Título del Evento en 2 líneas al menos como max', 'code': 'CIT-710'},
    ],
    'Día 2': [
      {'time': '11:20 am', 'title': ' Dia 2 Título del Evento en 2 líneas al menos como max', 'code': 'CIT-710'},
    ],
    'Día 3': [
      // Agrega los eventos del día 3 aquí
    ],
  };

  final Map<String, Color> codeColors = {
    'CIT-110': Colors.blue,
    'CIT-210': Colors.green,
    'CIT-310': Colors.red,
    'CIT-410': Colors.orange,
    'CIT-510': Colors.amber,
    'CIT-610': Colors.teal,
    'CIT-710': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos', style: TextStyle(fontFamily: 'Roboto')),
        backgroundColor: Colors.black, 
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline), 
            onPressed: () {
              // Acción al presionar el icono
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: events.keys.length,
        child: Column(
          children: [
            Container(
              color: Colors.black, 
              child: TabBar(
                tabs: events.keys.map((day) => Tab(text: day)).toList(),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade900, 
                child: TabBarView(
                  children: events.keys.map((day) {
                    return ListView.builder(
                      itemCount: events[day]!.length,
                      itemBuilder: (context, index) {
                        final event = events[day]![index];
                        final isNewTime = index == 0 ||
                            events[day]![index - 1]['time'] != event['time'];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isNewTime)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  event['time'] ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventPageScreen(event: event),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(8.0),
                              splashColor: Colors.grey.shade800, // Color al hacer click
                              child: Container(
                                width: double.infinity, 
                                margin: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800, 
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, 
                                        vertical: 24.0, 
                                      ),
                                      child: Text(
                                        event['title'] ?? '',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      right: 8,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 4.0), 
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                        child: Text(
                                          event['code'] ?? '',
                                          style: TextStyle(
                                            color: codeColors[event['code']],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
