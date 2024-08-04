class Presentador {
  String nombre;
  String hora;
  String descripcion;
  String biografia;
  String dia; // Nuevo campo para el día
  String salon; // Nuevo campo para el salón
  String fotoUrl; // URL de la foto
  String trabajoActual; // Nuevo campo para trabajo actual
  String linkedinUrl; // Nuevo campo para el enlace de LinkedIn

  Presentador({
    required this.nombre,
    required this.hora,
    required this.descripcion,
    required this.biografia,
    required this.dia,
    required this.salon,
    required this.fotoUrl,
    required this.trabajoActual,
    required this.linkedinUrl,
  });
}
