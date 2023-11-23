// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

final class Field {
  final String name;
  final String type;

  Field({required this.name, required this.type});
  Field.static()
      : name = '',
        type = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
    };
  }

  factory Field.fromMap(Map<String, dynamic> map) {
    return Field(
      name: map['name'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Field.fromJson(String source) => Field.fromMap(json.decode(source) as Map<String, dynamic>);
}
