import 'dart:convert';
import 'package:http/http.dart' as http;

class Presentador {
  String nombre;
  String hora;
  String descripcion;
  String dia;
  String salon;
  String fotoUrl;
  String linkedinUrl;

  Presentador({
    required this.nombre,
    required this.hora,
    required this.descripcion,
    required this.dia,
    required this.salon,
    required this.fotoUrl,
    required this.linkedinUrl,
  });

  static Future<List<Presentador>> buildSpeakersList() async {
    final url =
        Uri.parse('https://server-production-2c4b.up.railway.app/speakers');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) {
        return Presentador(
          nombre: json['speakerName'],
          hora: '12:00 p.m',
          descripcion: json['speakerDescription'],
          dia: 'Día 1',
          salon: 'CIT-123',
          fotoUrl: json['speakerImage'],
          linkedinUrl: json['linkedIn'],
        );
      }).toList();
    } else {
      throw Exception('Error al cargar los presentadores');
    }
  }
}
