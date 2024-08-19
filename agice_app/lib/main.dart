import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegúrate de que Flutter esté inicializado

  try {
    // Inicialización de Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Inicialización de OneSignal
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("0b71d6cd-e5da-4c6f-abde-cd8456476acf");
    OneSignal.Notifications.requestPermission(true); // Elimina await aquí

    // Inicia la aplicación
    runApp(MyApp());
  } catch (e, stacktrace) {
    // Manejo de errores
    print("Error al inicializar Firebase o OneSignal: $e");
    print("Stacktrace: $stacktrace");
  }
}
