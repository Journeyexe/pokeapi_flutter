import 'package:bloc/bloc.dart';
import 'package:pokeapi_flutter/data/bloc/pokemon_event.dart';
import 'package:pokeapi_flutter/data/bloc/pokemon_state.dart';
import 'package:pokeapi_flutter/data/http/client.dart';
import 'package:pokeapi_flutter/data/repositories/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _repository;

  PokemonBloc()
      : _repository = PokemonRepository(client: HttpClient()),
        super(const PokemonState()) {
    on<GetPokemon>(_onGetPokemon);
  }

  Future<void> _onGetPokemon(
      GetPokemon event, Emitter<PokemonState> emit) async {
    try {
      emit(state.copyWith(status: PokemonStatus.loading));
      final lista = await _repository.getPokemon();
      emit(state.copyWith(status: PokemonStatus.loaded, lista: lista));
    } catch (e) {
      emit(state.copyWith(
        status: PokemonStatus.error,
        exception: Exception('Failed to fetch Pokémon: $e'),
      ));
    }
  }
}
