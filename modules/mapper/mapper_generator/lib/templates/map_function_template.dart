import 'package:mapper_generator/models/field.dart';

class MapFunctionTemplate {
  final List<Field> fromFields;
  final List<Field> toFields;
  final String from;
  final String to;

  MapFunctionTemplate({
    required this.fromFields,
    required this.toFields,
    required this.from,
    required this.to,
  });

  String generate() {
    final buffer = StringBuffer();

    buffer.writeln('  $to from\$$from\$to$to($from source) {');
    buffer.writeln('    return $to(');
    for (var i = 0; i < fromFields.length; i++) {
      final fromField = fromFields[i];

      if (i >= toFields.length) {
        break;
      }

      final toField = toFields[i];

      bool hasNecessaryCasting = false;

      bool checkNullableToField = toField.type.endsWith('?');
      bool checkNullableFromField = fromField.type.endsWith('?');

      if (checkNullableToField && !checkNullableFromField) {
        hasNecessaryCasting = false;
      } else if (!checkNullableToField && checkNullableFromField) {
        hasNecessaryCasting = true;
      } else if (checkNullableToField && checkNullableFromField) {
        final toType = toField.type.replaceAll('?', '');
        final fromType = fromField.type.replaceAll('?', '');

        hasNecessaryCasting = toType != fromType;
      }

      if (hasNecessaryCasting) {
        buffer.writeln('      ${toField.name}: source.${fromField.name} as ${toField.type},');
      } else {
        buffer.writeln('      ${toField.name}: source.${fromField.name},');
      }
    }
    buffer.writeln('    );');
    buffer.writeln('  }');

    return buffer.toString();
  }

  String getFunctionName() {
    return '_MapFunctions.instance.from\$$from\$to$to';
  }
}
