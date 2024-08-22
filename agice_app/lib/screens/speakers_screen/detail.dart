import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'host.dart';

class PantallaDetalle extends StatelessWidget {
  final Presentador presentador;

  PantallaDetalle({Key? key, required this.presentador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(presentador.nombre,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        color: const Color.fromRGBO(84, 84, 84, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              presentador.nombre,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              presentador.descripcion,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(presentador.fotoUrl),
            ),
            const SizedBox(height: 24),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              color: Colors.white,
              iconSize: 40,
              onPressed: () async {
                final Uri url = Uri.parse(presentador.linkedinUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'No se pudo abrir $url';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
