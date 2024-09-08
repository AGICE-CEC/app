import 'package:agice_app/screens/event_screen/eventos_screen.dart';
import 'package:agice_app/screens/speakers_screen/acordeon.dart';

import '../screens/registration_screen.dart';
import '../screens/main_screen/main_screen.dart';
import '../screens/map_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const MainScreen(),
    '/registration': (context) => const RegistrationScreen(),
    '/mapa': (context) => const MapScreen(),
    '/main': (context) => const MainScreen(),
    '/events': (context) => const EventsPage(),
    '/speakers': (context) => const PantallaPresentadores(),
  };
}
