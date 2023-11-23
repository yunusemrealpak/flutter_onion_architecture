import '../models/dependency_config.dart';

class AutoMapperTemplate {
  final List<String> importedFiles;
  final List<Map<String, String>> mappers;
  final List<DependencyConfig> configs;

  AutoMapperTemplate({
    required this.importedFiles,
    required this.mappers,
    required this.configs,
  });

  String generate() {
    final buffer = StringBuffer();

    final fromPaths = configs.map((e) => e.fromPath).toSet().toList();
    final toPaths = configs.map((e) => e.toPath).toSet().toList();

    final paths = [...fromPaths, ...toPaths].map((e) => e).toSet().toList();

    for (var path in paths) {
      buffer.writeln('import \'$path\';');
    }

    buffer
      ..writeln('import \'package:mapper_annotation/mapper_annotation.dart\';')
      ..writeln('')
      ..writeln('abstract class \$AutoMapper implements IMapper {')
      ..writeln('  final List<Map3Entry> _mappers = [');
    for (int i = 0; i < mappers.length; i++) {
      final config = configs[i];
      final mapper = mappers[i];
      buffer.writeln('    Map3Entry(\'${config.from}\', \'${config.to}\', ${mapper['functionName']}),');
    }
    buffer
      ..writeln('  ];')
      ..writeln('')
      ..writeln('  @override')
      ..writeln('  T map<T>(dynamic source) {')
      ..writeln('    final mapper = _mappers.firstWhere(')
      ..writeln('      (mapper) => mapper.from == source.runtimeType.toString(),')
      ..writeln('      orElse: () => throw Exception(')
      ..writeln('          \'Mapper not found for \${source.runtimeType.toString()}\'),')
      ..writeln('    );')
      ..writeln('    return mapper.mapFunction(source) as T;')
      ..writeln('  }')
      ..writeln('')
      ..writeln('   @override')
      ..writeln('  List<T> mapList<T>(List<dynamic> source) {')
      ..writeln('    return source.map((e) => map<T>(e)).toList();')
      ..writeln('  }')
      ..writeln('}')
      ..writeln('')
      ..writeln('// **************************************************************************')
      ..writeln('');

    buffer
      ..writeln('class _MapFunctions {')
      ..writeln('  static _MapFunctions instance = _MapFunctions._();')
      ..writeln('  _MapFunctions._();')
      ..writeln('')
      ..writeln('  ${mappers.map((mapper) => mapper['function']).join('\n  ')}')
      ..writeln('}')
      ..writeln('');

    return buffer.toString();
  }
}
