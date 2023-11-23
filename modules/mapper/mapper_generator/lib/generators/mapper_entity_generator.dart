import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:source_gen/source_gen.dart';

class MapperEntityGenerator extends GeneratorForAnnotation<Mapper> {
  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError('MapFrom can only be used on classes.', element: element);
    }

    var classElement = element;
    var buffer = StringBuffer();

    // Sınıf ismi ve tür bilgilerini al
    var className = classElement.name;
    var path = classElement.source.uri.path.split('/').last;
    var mappingType = annotation.read('as').typeValue;

    if (mappingType.element == null) {
      throw InvalidGenerationSourceError('The `as` parameter must be a class.', element: element);
    } else if (mappingType.element != null && mappingType.element!.kind != ElementKind.CLASS && mappingType.element!.name == 'NoType') {
      throw InvalidGenerationSourceError('The `as` parameter must be a class.', element: element);
    }

    final mappingTypeName = mappingType.getDisplayString(withNullability: false);
    final mappingElement = mappingType.element! as ClassElement;

    // Sınıf için bir constructor oluştur
    buffer.writeln('part of \'$path\';');
    buffer.writeln('');
    buffer.writeln('$mappingTypeName _\$from${mappingType.element!.name}($className source) {');
    buffer.writeln('  return $mappingTypeName(');

    for (var i = 0; i < classElement.fields.length; i++) {
      final field = classElement.fields[i];
      final mappingField = mappingElement.fields[i];

      if (!field.isStatic) {
        buffer.writeln('    ${field.name}: source.${mappingField.name},');
      }
    }

    buffer.writeln('  );');
    buffer.writeln('}');

    return buffer.toString();
  }
}
