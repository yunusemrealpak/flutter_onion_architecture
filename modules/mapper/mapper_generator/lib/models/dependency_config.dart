// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mapper_generator/models/field.dart';

class DependencyConfig {
  final String from;
  final String fromPath;
  final String to;
  final String toPath;
  final List<Field> fromFields;
  final List<Field> toFields;
  final bool reverseMap;

  DependencyConfig({
    required this.from,
    required this.fromPath,
    required this.toPath,
    required this.to,
    required this.reverseMap,
    required this.fromFields,
    required this.toFields,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'fromPath': fromPath,
      'to': to,
      'toPath': toPath,
      'fromFields': fromFields,
      'toFields': toFields,
      'reverseMap': reverseMap,
    };
  }

  factory DependencyConfig.fromMap(Map<String, dynamic> map) {
    return DependencyConfig(
      from: map['from'] as String,
      fromPath: map['fromPath'] as String,
      to: map['to'] as String,
      toPath: map['toPath'] as String,
      reverseMap: map['reverseMap'] as bool,
      fromFields: (map['fromFields'] as List<dynamic>).map((e) => Field.fromJson(e)).toList(),
      toFields: (map['toFields'] as List<dynamic>).map((e) => Field.fromJson(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DependencyConfig.fromJson(String source) => DependencyConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}
