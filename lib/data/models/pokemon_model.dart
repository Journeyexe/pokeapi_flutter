// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonModel {
  final int id;
  final String name;
  final String sprite;
  final String spriteShiny;
  final String animated;
  final String animatedShiny;
  final List<TypeModel> types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.sprite,
    required this.spriteShiny,
    required this.animated,
    required this.animatedShiny,
    required this.types,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'sprite': sprite,
      'spriteShiny': spriteShiny,
      'animated': animated,
      'animatedShiny': animatedShiny,
      'types': types,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      sprite: map['sprites']['front_default'] as String,
      spriteShiny: map['sprites']['front_shiny'] as String,
      animated: map['sprites']['versions']['generation-v']['black-white']
          ['animated']['front_default'] ?? map['sprites']['front_default'],
      animatedShiny: map['sprites']['versions']['generation-v']['black-white']
          ['animated']['front_shiny'] ?? map['sprites']['front_shiny'],
      types: (map['types'] as List)
          .map((item) => TypeModel.fromMap(item))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TypeModel {
  final String name;
  final String url;

  TypeModel({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      name: map['type']['name'] as String,
      url: map['type']['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) =>
      TypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
