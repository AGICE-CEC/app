import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// Error Helper
void showFlashError(BuildContext context, String message, double height) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: _buildErrorSnackBarContent(message),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: height),
      backgroundColor: Colors.black.withOpacity(0.5),
      duration: const Duration(seconds: 3),
      action: _buildSnackBarAction(context),
    ),
  );
}

Widget _buildErrorSnackBarContent(String message) {
  return SizedBox(
    height: 40,
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
  );
}

SnackBarAction _buildSnackBarAction(BuildContext context) {
  return SnackBarAction(
    label: 'Dismiss',
    textColor: Colors.black,
    backgroundColor: Colors.white,
    onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
  );
}

// Email Verification Helper
Future<String?> verifyEmail(String email) async {
  final url = Uri.parse(
      'https://server-production-2c4b.up.railway.app/attendees/$email');

  try {
    final response = await http.get(url);

    switch (response.statusCode) {
      case 200:
        return null; // No errors
      case 400:
        return 'Solicitud inválida. Verifica los datos e intenta nuevamente.';
      case 401:
        return 'Usuario no autenticado. Verifica tus credenciales.';
      case 500:
        return 'Error en el servidor. Intenta nuevamente más tarde.';
      default:
        return 'Error inesperado.';
    }
  } on SocketException {
    return 'No tienes conexión a Internet.';
  } on http.ClientException {
    return 'Error en tu conexión de red.';
  } catch (e) {
    return e.toString();
  }
}

// URL Launch Helper
Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

// Registration Screen
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double containerHeight = constraints.maxHeight * 0.8;
                    return _buildContent(context, containerHeight, constraints);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fondo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, double containerHeight,
      BoxConstraints constraints) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width > 500
              ? 500
              : MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: constraints.maxHeight * 0.02),
                _buildLogos(constraints),
                _buildTextContent(constraints),
                SizedBox(height: constraints.maxHeight * 0.04),
                _buildForm(context, containerHeight, constraints),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogos(BoxConstraints constraints) {
    return Row(
      children: <Widget>[
        _buildLogo('assets/astronatua.png', constraints.maxHeight * 0.06),
        _buildLogo('assets/cec2024.png', constraints.maxHeight * 0.055),
      ],
    );
  }

  Widget _buildLogo(String asset, double height) {
    return Expanded(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(asset), fit: BoxFit.contain),
          boxShadow: _buildLogoShadows(),
        ),
      ),
    );
  }

  List<BoxShadow> _buildLogoShadows() {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 7),
          blurRadius: 10),
      BoxShadow(
          color: Colors.white.withOpacity(0.35),
          offset: const Offset(0, 0),
          blurRadius: 20),
    ];
  }

  Widget _buildTextContent(BoxConstraints constraints) {
    return Column(
      children: [
        _buildText("Bienvenido al Congreso Espacial Centroamericano",
            constraints, 0.054, FontWeight.bold),
        _buildText(
          "¡Promoviendo la colaboración en proyectos espaciales, uniendo a Centroamérica con el Espacio y el mundo!",
          constraints,
          0.04,
          FontWeight.normal,
        ),
      ],
    );
  }

  Widget _buildText(String text, BoxConstraints constraints,
      double fontSizeFactor, FontWeight weight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.02),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.white, fontWeight: weight),
      ),
    );
  }

  Widget _buildForm(BuildContext context, double containerHeight,
      BoxConstraints constraints) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildEmailField(constraints),
          SizedBox(height: constraints.maxWidth * 0.07),
          _buildSubmitButton(context, containerHeight, constraints),
          SizedBox(height: constraints.maxWidth * 0.07),
          _buildMoreButton(),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildEmailField(BoxConstraints constraints) {
    return SizedBox(
      width: constraints.maxWidth * 0.8,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: _buildEmailInputDecoration(),
        validator: _emailValidator,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  InputDecoration _buildEmailInputDecoration() {
    return const InputDecoration(
      prefixIcon: Icon(Icons.email, color: Colors.white),
      labelText: 'Email',
      labelStyle: TextStyle(color: Colors.white),
      hintText: 'Ingrese su email',
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedErrorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      errorStyle: TextStyle(color: Colors.white),
    );
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  Widget _buildSubmitButton(BuildContext context, double containerHeight,
      BoxConstraints constraints) {
    return SizedBox(
      width: constraints.maxWidth * 0.8,
      height: 50,
      child: TextButton(
        onPressed: () => _onSubmit(context, containerHeight),
        style: _buildSubmitButtonStyle(),
        child: const Text("Ingresar",
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }

  ButtonStyle _buildSubmitButtonStyle() {
    return TextButton.styleFrom(
      backgroundColor: const Color(0xFF848484),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }

  Future<void> _onSubmit(BuildContext context, double containerHeight) async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final error = await verifyEmail(email);
      if (error == null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLogin', true);
        Navigator.of(context).pushReplacementNamed('/main');
      } else {
        showFlashError(context, error, containerHeight);
      }
    }
  }

  Widget _buildMoreButton() {
    return GestureDetector(
      onTap: () => launchURL('https://nasa.gov'),
      child: const Text(
        'Más información',
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.white,
            fontSize: 20),
      ),
    );
  }
}
