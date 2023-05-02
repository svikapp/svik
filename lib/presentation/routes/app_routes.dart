import 'package:flutter/widgets.dart';
import 'package:svik/presentation/pages/pages.dart';


class AppRoutes {
  static const String decider = '/';
  static const String home = '/home';
  static const String settingsTheme = '/setting';
  static const String settingsAbout = '/setting/about';
  static const String login = '/login';
  static const String signup = '/signup';


  static Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => const DeciderView(),
      "/home":(context) => const HomePage(),
      "/setting": (context) =>  const SettingsView(),
      "/settings/theme": (context) => const SetThemeView(),
      "/settings/about": (context) => const AboutView(),
      "/login": (context) => LoginView(),
      "/signup": (context) => SignupPage(),
    };
  }
}
