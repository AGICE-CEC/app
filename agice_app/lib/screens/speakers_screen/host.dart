import 'dart:convert';
import 'package:http/http.dart' as http;

class Presentador {
  String nombre;
  String pais;
  String descripcion;
  String contacto;
  String fotoUrl;
  String linkedinUrl;

  Presentador({
    required this.nombre,
    required this.pais,
    required this.descripcion,
    required this.contacto,
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
          nombre: json['speakerName'] ?? '',
          pais: json['country'] ?? '',
          descripcion: json['speakerDescription'] ?? '',
          contacto: json['contact'] ?? '',
          fotoUrl: json['speakerImage'] ?? '',
          linkedinUrl: json['linkedIn'] ?? 'null',
        );
      }).toList();
    } else {
      throw Exception('Error al cargar los presentadores');
    }
  }
}
