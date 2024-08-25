import '../screens/event_screen/main_event_screen.dart';
import '../screens/speakers_screen/main_speaker_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/main_screen/main_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const WelcomeScreen(),
    '/registration': (context) => const RegistrationScreen(),
    '/main': (context) => MainScreen(),
    '/events': (context) => const MainEventsScreen(),
    '/speakers': (context) => MainSpeakerScreen(),
  };
}
