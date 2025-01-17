import 'dart:convert';

class TypeDetailsModel {
  final String name;
  final String imageUrl;

  TypeDetailsModel({required this.name, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory TypeDetailsModel.fromMap(Map<String, dynamic> map) {
    return TypeDetailsModel(
      name: map['name'] as String,
      imageUrl:
          map['sprites']['generation-v']['black-white']['name_icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeDetailsModel.fromJson(String source) =>
      TypeDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
