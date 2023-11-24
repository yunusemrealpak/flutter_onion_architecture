import 'mapper_field.dart';

class Mapper {
  final Type as;
  final List<MapperField>? fields;
  final bool reverseMap;
  const Mapper({required this.as, this.fields, this.reverseMap = false});
}

const mapper = Mapper(as: NoType, reverseMap: true);

final class NoType {}
