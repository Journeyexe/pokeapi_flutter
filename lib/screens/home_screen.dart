import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/routes/app_routes.dart';
import 'package:pokeapi_flutter/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home Screen', isHomePage: true),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.list),
              child: const Text('Melhor geração'),
            ),
          ],
        ),
      ),
    );
  }
}
