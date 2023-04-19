import 'package:flutter/widgets.dart';
import 'package:svik/presentation/pages/pages.dart';


class AppRoutes {
  static const String home = '/';
  static const String settingsTheme = '/setting';
  static const String settingsAbout = '/setting/about';
  static const String login = '/login';
  static const String signup = '/signup';


  static Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => const DeciderView(),
      "/setting": (context) =>  const SettingsView(),
      "/settings/theme": (context) => const SetThemeView(),
      "/settings/about": (context) => const AboutView(),
      "/login": (context) => LoginView(),
      "/signup": (context) => SignupPage(),
    };
  }
}
