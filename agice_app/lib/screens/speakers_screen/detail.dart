import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'host.dart';

class PantallaDetalle extends StatelessWidget {
  final Presentador presentador;

  const PantallaDetalle({super.key, required this.presentador});

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
        padding: const EdgeInsets.all(25.0),
        color: const Color.fromRGBO(84, 84, 84, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(presentador.fotoUrl),
            ),
            const SizedBox(height: 8),
            Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: SingleChildScrollView(
                child: Text(
                  presentador.descripcion,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: presentador.linkedinUrl != "null",
              child: IconButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
