import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:source_gen/source_gen.dart';

import '../models/dependency_config.dart';
import '../templates/auto_mapper_template.dart';
import '../templates/map_function_template.dart';

class MapperConfigGenerator extends GeneratorForAnnotation<MapperInit> {
  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    final injectableConfigFiles = Glob("lib/**.mapping.json");

    List<String> importedFiles = [];
    List<Map<String, String>> mappers = [];
    List<DependencyConfig> configs = [];

    await for (final id in buildStep.findAssets(injectableConfigFiles)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      final config = DependencyConfig.fromMap(json);

      configs.add(config);

      if (config.reverseMap) {
        final reverseConfig = DependencyConfig(
          from: config.to,
          to: config.from,
          fromPath: config.toPath,
          toPath: config.fromPath,
          fromFields: config.toFields,
          toFields: config.fromFields,
          reverseMap: false,
        );

        configs.add(reverseConfig);
      }

      final mapperTemplate = MapFunctionTemplate(
        fromFields: config.fromFields,
        toFields: config.toFields,
        from: config.from,
        to: config.to,
      );

      mappers.add(Map<String, String>.from({
        'function': mapperTemplate.generate(),
        'functionName': mapperTemplate.getFunctionName(),
      }));

      if (config.reverseMap) {
        final reverseMapperTemplate = MapFunctionTemplate(
          fromFields: config.toFields,
          toFields: config.fromFields,
          from: config.to,
          to: config.from,
        );

        mappers.add(Map<String, String>.from({
          'function': reverseMapperTemplate.generate(),
          'functionName': reverseMapperTemplate.getFunctionName(),
        }));
      }
    }

    final output = AutoMapperTemplate(importedFiles: importedFiles, mappers: mappers, configs: configs).generate();

    return output;
  }
}
