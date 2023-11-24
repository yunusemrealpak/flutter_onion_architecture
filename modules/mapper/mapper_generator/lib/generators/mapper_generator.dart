import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:source_gen/source_gen.dart';

import '../models/dependency_config.dart';
import '../models/field.dart';

class MapperGenerator extends GeneratorForAnnotation<Mapper> {
  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.displayName}`.',
      );
    }

    final constant = annotation.objectValue;
    final mapperFieldObjects = constant.getField('fields')?.toListValue() ?? [];

    final mapperFields = mapperFieldObjects
        .map(
          (e) => MapperField(
            e.getField('name')!.toStringValue()!,
            from: e.getField('from')?.toStringValue(),
            ignore: e.getField('ignore')?.toBoolValue() ?? false,
          ),
        )
        .toList();

    for (var field in mapperFields) {
      if (field.name.isEmpty) {
        throw InvalidGenerationSourceError(
          'You must provide a `name` parameter of MapperField.',
        );
      }
    }

    final classElement = element;
    final classFields = classElement.fields.map((e) {
      if (e.isStatic || e.isSynthetic) return Field.static();

      return Field(name: e.name, type: e.type.getDisplayString(withNullability: false));
    }).toList();
    classFields.removeWhere((element) => element.name.isEmpty);
    final to = annotation.peek('as')?.typeValue;

    if (to == null || to.element == null) {
      throw InvalidGenerationSourceError(
        'You must provide a `to` parameter.',
      );
    } else if (to.element != null && to.element!.kind != ElementKind.CLASS) {
      throw InvalidGenerationSourceError(
        'The `to` parameter must be a class.',
      );
    }

    final mappingElement = to.element! as ClassElement;
    final mappingFields = mappingElement.fields.map((e) {
      if (e.isStatic || e.isSynthetic) return Field.static();

      return Field(name: e.name, type: e.type.getDisplayString(withNullability: true));
    }).toList();
    mappingFields.removeWhere((element) => element.name.isEmpty);

    final reverseMap = annotation.read('reverseMap').boolValue;

    if (mapperFields.isNotEmpty) {
      for (var field in mapperFields) {
        // if (!field.ignore && field.from == null) {
        //   throw InvalidGenerationSourceError(
        //     'You must provide a `from` parameter of MapperField.',
        //   );
        // }

        // if (!field.ignore && !classFields.any((element) => element.name == field.from)) {
        //   throw InvalidGenerationSourceError(
        //     'The `from` parameter of MapperField must be a field of the class.',
        //   );
        // }

        // if (!field.ignore && !mappingFields.any((element) => element.name == field.name)) {
        //   throw InvalidGenerationSourceError(
        //     'The `name` parameter of MapperField must be a field of the `as` class.',
        //   );
        // }

        if (field.ignore) {
          classFields.removeWhere((element) => element.name == field.name);
          mappingFields.removeWhere((element) => element.name == field.from);
        } else {
          final classField = classFields.firstWhere((element) => element.name == field.name);
          final mappingField = mappingFields.firstWhere((element) => element.name == field.from);

          final field1 = classField.copyWith(name: field.name);
          classFields[classFields.indexOf(classField)] = field1;

          final field2 = mappingField.copyWith(name: field.from);
          mappingFields[mappingFields.indexOf(mappingField)] = field2;
        }
      }
    }

    final config = DependencyConfig(
      from: classElement.displayName,
      fromPath: element.source.uri.toString(),
      to: to.element!.displayName,
      toPath: to.element!.source!.uri.toString(),
      reverseMap: reverseMap,
      fromFields: classFields,
      toFields: mappingFields,
    ).toJson();

    return config;
  }
}
