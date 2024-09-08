import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

void showFlashError(
    BuildContext context, String message, double height_father) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SizedBox(
        height: 40, // Adjust the height as needed
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: height_father,
      ),
      backgroundColor: Colors.black.withOpacity(0.5),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.black,
        backgroundColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

Future<String?> verificarEmail(String email) async {
  final url = Uri.parse(
      'https://server-production-2c4b.up.railway.app/attendees/$email');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return null; // Sin errores
    } else if (response.statusCode == 400) {
      return 'Solicitud inválida. Verifica los datos e intenta nuevamente.';
    } else if (response.statusCode == 401) {
      return 'Usuario no autenticado. Verifica tus credenciales.';
    } else if (response.statusCode == 500) {
      return 'Error en el servidor. Intenta nuevamente más tarde.';
    } else {
      return 'Error inesperado:';
    }
  } on SocketException {
    return 'No tienes conexión a Internet.';
  } on http.ClientException {
    return 'Tienes error en tu conexion de red';
  } catch (e) {
    return '$e';
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double containerHeight = constraints.maxHeight * 0.8;
                    return Container(
                      color: Colors.black.withOpacity(0.5),
                      constraints: const BoxConstraints.tightFor(
                          width: double.infinity, height: null),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: constraints.maxHeight * 0.06,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/astronatua.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: const Offset(0, 7),
                                        blurRadius: 10,
                                      ),
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
                                flex: 8,
                                child: Container(
                                  height: constraints.maxHeight * 0.055,
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
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Text(
                            "Bienvenido al Congreso Espacial Centroamericano",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.054,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),
                          Text(
                            "¡Promoviendo la colaboración en proyectos espaciales, uniendo a Centroamérica con el Espacio y el mundo!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.03,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: constraints.maxWidth * 0.8,
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email,
                                          color: Colors.white),
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'Ingrese su email',
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
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
                                SizedBox(height: constraints.maxWidth * 0.07),
                                SizedBox(
                                  width: constraints.maxWidth * 0.8,
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        final email = _emailController.text;
                                        final error =
                                            await verificarEmail(email);
                                        if (error == null) {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          await prefs.setBool('isLogin', true);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context)
                                              .pushReplacementNamed('/main');
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showFlashError(
                                              context, error, containerHeight);
                                        }
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFF848484),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    child: const Text(
                                      "Ingresar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: constraints.maxWidth * 0.07),
                                SafeArea(
                                  child: SizedBox(
                                    width: constraints.maxWidth * 0.8,
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () async {
                                        _launchURL('https://cecspace.org');
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        side: const BorderSide(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      child: const Text(
                                        "Ver Más",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
