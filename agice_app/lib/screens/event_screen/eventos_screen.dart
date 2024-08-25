import 'package:flutter/material.dart';
import 'event_page_screen.dart';
import 'statement.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Future<List<DayEvent>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = EventData.fetchAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos', style: TextStyle(fontFamily: 'Roboto', color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), 
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline), 
            onPressed: () {
              // Acción al presionar el icono
            },
          ),
        ],
      ),
      body: FutureBuilder<List<DayEvent>>(
        future: futureEvents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No events found'));
          }

          var eventsByDay = snapshot.data!;

          return DefaultTabController(
            length: eventsByDay.length,
            child: Column(
              children: [
                Container(
                  color: Colors.black, 
                  child: TabBar(
                    tabs: eventsByDay.map((dayEvent) => Tab(text: 'Día ${dayEvent.day}')).toList(),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey.shade900, 
                    child: TabBarView(
                      children: eventsByDay.map((dayEvent) {
                        return ListView.builder(
                          itemCount: dayEvent.events.length,
                          itemBuilder: (context, index) {
                            final event = dayEvent.events[index];
                            final isNewTime = index == 0 ||
                                dayEvent.events[index - 1].hour != event.hour;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (isNewTime)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Text(
                                      event.hour,
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
                                        builder: (context) => EventPageScreen(eventId: event.eventId),
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
                                            event.title,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
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
          );
        },
      ),
    );
  }
}
