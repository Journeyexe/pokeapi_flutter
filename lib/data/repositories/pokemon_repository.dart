import 'dart:convert';

import 'package:pokeapi_flutter/data/http/client.dart';
import 'package:pokeapi_flutter/data/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future getPokemon() async {}
}

class PokemonRepository implements IPokemonRepository{
  static const url = 'https://pokeapi.co/api/v2/pokemon/';
  final IHttpClient client;

  PokemonRepository({required this.client});

  @override
  Future<List<PokemonModel>> getPokemon() async {
    final List<Future<PokemonModel>> futurePokemons = [];

    for (int i = 252; i <= 386; i++){
      futurePokemons.add(_fetchPokemon(i));
    }

    return await Future.wait(futurePokemons);
  }

  Future<PokemonModel> _fetchPokemon(int id) async {
    final response =
        await client.get('$url$id');
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return PokemonModel.fromMap(body);
    } else {
      throw Exception('Erro ao buscar Pokémon $id');
    }
  }
}