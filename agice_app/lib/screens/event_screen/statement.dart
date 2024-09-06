import 'dart:convert';
import 'package:http/http.dart' as http;

class Event {
  final int eventId;
  final String title;
  final String description;
  final String hour;
  final String hourEnd;
  final String room;

  Event({
    required this.eventId,
    required this.title,
    required this.description,
    required this.hour,
    required this.hourEnd,
    required this.room,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'] ?? 0, 
      title: json['event_title'] ?? 'Untitled Event', 
      description: json['event_description'] ?? 'No description available',
      hour: json['hour'] ?? '00:00', 
      hourEnd: json['hour_end'] ?? '00:00', 
      room: json['room'] ?? 'Unknown Room', 
    );
  }
}

class DayEvent {
  final int day;
  final List<Event> events;

  DayEvent({
    required this.day,
    required this.events,
  });

  factory DayEvent.fromJson(Map<String, dynamic> json) {
    var eventsFromJson = json['events'] as List;
    List<Event> eventList = eventsFromJson.map((eventJson) => Event.fromJson(eventJson)).toList();

    return DayEvent(
      day: json['day'],
      events: eventList,
    );
  }
}

class EventDetail {
  final int eventId;
  final String title;
  final String description;
  final int day;
  final String hour;
  final String hourEnd;
  final String room;
  final Location location;
  final List<Speaker> speakers;

  EventDetail({
    required this.eventId,
    required this.title,
    required this.description,
    required this.day,
    required this.hour,
    required this.hourEnd,
    required this.room,
    required this.location,
    required this.speakers,
  });

  factory EventDetail.fromJson(Map<String, dynamic> json) {
    var speakersFromJson = json['speakers'] as List;
    List<Speaker> speakerList = speakersFromJson.map((speakerJson) => Speaker.fromJson(speakerJson)).toList();

    return EventDetail(
      eventId: json['event_id'],
      title: json['event_title'] ?? 'Untitled Event', 
      description: json['event_description'] ?? 'No description available', 
      day: json['day'],
      hour: json['hour'] ?? '00:00',
      hourEnd: json['hour_end'] ?? '00:00', 
      room: json['room'] ?? 'Unknown Room', 
      location: Location.fromJson(json['location']),
      speakers: speakerList,
    );
  }
}

class Location {
  final int id;
  final String description;

  Location({
    required this.id,
    required this.description,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      description: json['description'] ?? 'Location not available', // Fallback for null description
    );
  }
}

class Speaker {
  final int id;
  final String name;
  final String image;

  Speaker({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) {
    return Speaker(
      id: json['id'],
      name: json['name'] ?? 'Unknown Speaker', 
      image: json['image'] ?? '', 
    );
  }
}

class EventData {
  static const String baseUrl = 'https://server-production-2c4b.up.railway.app';

  // Fetch all events
  static Future<List<DayEvent>> fetchAllEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/events'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((dayEventJson) => DayEvent.fromJson(dayEventJson)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  // Fetch event detail by event ID
  static Future<EventDetail> fetchEventDetail(int eventId) async {
    final response = await http.get(Uri.parse('$baseUrl/events/$eventId'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return EventDetail.fromJson(jsonResponse[0]);
    } else {
      throw Exception('Failed to load event detail');
    }
  }
}
