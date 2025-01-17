import 'package:equatable/equatable.dart';
import 'package:pokeapi_flutter/data/models/pokemon_model.dart';

enum PokemonStatus { initial, loading, loaded, error }

class PokemonState extends Equatable {
  final PokemonStatus status;
  final List<PokemonModel> lista;
  final Exception? exception;

  const PokemonState({
    this.status = PokemonStatus.initial,
    this.lista = const [],
    this.exception,
  });

  PokemonState copyWith({
    PokemonStatus? status,
    List<PokemonModel>? lista,
    Exception? exception,
  }) {
    return PokemonState(
      status: status ?? this.status,
      lista: lista ?? this.lista,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, lista, exception];
}
