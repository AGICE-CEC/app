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
      // Agrega los eventos del día 2 aquí
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
        title: Text('Eventos'),
      ),
      body: DefaultTabController(
        length: events.keys.length,
        child: Column(
          children: [
            TabBar(
              tabs: events.keys.map((day) => Tab(text: day)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: events.keys.map((day) {
                  return ListView(
                    children: events[day]!.map((event) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        leading: Text(event['time'] ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                        title: Text(
                          event['title'] ?? '',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: codeColors[event['code']],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            event['code'] ?? '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          // Aquí puedes agregar la lógica para navegar a otra página de detalles del evento
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailsPage(event: event),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDetailsPage extends StatelessWidget {
  final Map<String, String> event;

  EventDetailsPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event['title'] ?? 'Detalles del Evento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event['title'] ?? '',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Horario: ${event['time']}'),
            SizedBox(height: 8.0),
            Text('Código: ${event['code']}'),
            // Agrega más detalles del evento aquí
          ],
        ),
      ),
    );
  }
}
