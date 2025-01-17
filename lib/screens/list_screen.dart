// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_flutter/data/bloc/pokemon_bloc.dart';
import 'package:pokeapi_flutter/data/bloc/pokemon_event.dart';
import 'package:pokeapi_flutter/data/bloc/pokemon_state.dart';
import 'package:pokeapi_flutter/services/type_colors.dart';
import 'package:pokeapi_flutter/widgets/custom_app_bar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final PokemonBloc _pokemonBloc;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = PokemonBloc();
    _pokemonBloc.add(const GetPokemon());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Listar Pokemon'),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        bloc: _pokemonBloc,
        builder: (context, state) {
          if (state.status == PokemonStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == PokemonStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Icon(Icons.error), Text('${state.exception}')],
              ),
            );
          }
          final screenWidth = MediaQuery.of(context).size.width;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: screenWidth,
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...state.lista.map((pokemon) {
                        return Container(
                          width: screenWidth * .47,
                          decoration: BoxDecoration(
                            color: TypeColors.getColor(pokemon.types[0].name),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: FittedBox(
                                    child: Text(
                                      pokemon.name[0].toUpperCase() +
                                          pokemon.name.substring(1),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                CachedNetworkImage(
                                  placeholder: (context, url) => const Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  ),
                                  imageUrl: pokemon.sprite,
                                  // height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
