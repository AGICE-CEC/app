import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'), // Ruta de la imagen
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.zero,
                alignment: Alignment.topLeft,
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2, // 20%
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/astronatua.png'),
                                fit: BoxFit.contain,
                              ),
                              boxShadow: [
                                // Sombra negra
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 7),
                                  blurRadius: 10,
                                ),
                                // Sombra blanca
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.35),
                                  offset: const Offset(0, 0),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8, // 80%
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/cec2024.png'),
                                fit: BoxFit.contain,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 7),
                                  blurRadius: 22,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.35),
                                  offset: const Offset(0, 0),
                                  blurRadius: 15.1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text(
                      "Bienvenido al Congreso Espacial Centroamericano",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Text(
                        "¡Promoviendo la colaboración en proyectos espaciales, uniendo a Centroamérica con el Espacio y el mundo!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.white),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'Ingrese su email',
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorStyle: TextStyle(color: Colors.white),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, ingrese su email';
                                  }

                                  final emailRegex =
                                      RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Ingrese un email válido';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      print(
                                          "complete"); //aqui agregamos la funcion para llamar a la api
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFF848484)),
                                  child: const Text(
                                    "Registrate",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: OutlinedButton(
                                  onPressed: () async {
                                    final url =
                                        'https://www.ejemplo.com'; // Reemplaza con el enlace al que deseas redirigir
                                    try {
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        print(
                                            'No se pudo abrir el enlace: $url');
                                      }
                                    } catch (e) {
                                      print('Error al lanzar el enlace: $e');
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Colors.white, width: 1)),
                                  child: const Text(
                                    "Ver mas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
