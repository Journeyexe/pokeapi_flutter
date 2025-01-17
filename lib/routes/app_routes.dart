import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/screens/home_screen.dart';
import 'package:pokeapi_flutter/screens/list_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String list = '/list';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
      case list:
        return MaterialPageRoute(builder: (_) {
          return const ListScreen();
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'Rota nao definida: ${settings.name}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }
  }
}
