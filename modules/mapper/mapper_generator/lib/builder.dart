import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generators/mapper_config_generator.dart';
import 'generators/mapper_entity_generator.dart';
import 'generators/mapper_generator.dart';

Builder mapperBuilder(BuilderOptions options) => LibraryBuilder(MapperConfigGenerator(), generatedExtension: '.mapper.dart');

Builder mapperEntityBuilder(BuilderOptions options) => LibraryBuilder(MapperEntityGenerator(), generatedExtension: '.mapper.dart');

Builder mapperJsonBuilder(BuilderOptions options) {
  return LibraryBuilder(
    MapperGenerator(),
    formatOutput: (generated) => generated.replaceAll(RegExp(r'//.*|\s'), ''),
    generatedExtension: '.mapping.json',
  );
}
