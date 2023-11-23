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




// @override
//   FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {
//     final elements = <ClassElement>{};

//     for (var clazz in library.classes) {
//       if (_mapperChecker.hasAnnotationOfExact(clazz)) {
//         elements.add(clazz);
//         print('Anotasyonlu sınıflar bulundu: ${clazz.displayName}');
//         print('Kod üretiliyor: ${clazz.displayName}'); // Kod üretimi için loglama
//         print('Path üretiliyor: ${clazz.source.uri}'); // Kod üretimi için loglama

//         _generatedFiles.add(clazz.displayName);

//         print('Üretilenler: ${_generatedFiles.join(', ')}'); // Kod üretimi için loglama
//       }
//     }

//     return elements.map((e) {
//       final className = e.displayName;
//       final dependency = DependencyConfig(className, e.source.uri.toString(), to, reverseMap)
//       print('Json üretiliyor: $className'); // Kod üretimi için loglama
//       return """
// import '${e.source.uri}';
// final ${className.toLowerCase()}Instance = $className();
// """;
//     }).join('');

    // // Proje içindeki tüm kaynakları tara ve @mapper anotasyonlu sınıfları bul
    // await for (final id in buildStep.findAssets(Glob('lib/**/*.dart'))) {
    //   print('Dosya taranıyor: ${id.path}'); // Taranan dosya için loglama
    //   final lib = await buildStep.resolver.libraryFor(id);
    //   final reader = LibraryReader(lib);
    //   final annotatedElements = reader.annotatedWith(const TypeChecker.fromRuntime(Mapper)).map((e) => e.element).whereType<ClassElement>();
    //   elements.addAll(annotatedElements);

    //   if (annotatedElements.isNotEmpty) {
    //     print('Anotasyonlu sınıflar bulundu: ${annotatedElements.map((e) => e.displayName).join(', ')}');
    //   }
    // }

    // // Anotasyonlu sınıflar için kod oluştur
    // return elements.map((e) {
    //   final className = e.displayName;
    //   print('Kod üretiliyor: $className'); // Kod üretimi için loglama
    //   return "import '${e.source?.uri}';\nfinal ${className.toLowerCase()}Instance = $className();";
    // }).join('\n\n');
 // }