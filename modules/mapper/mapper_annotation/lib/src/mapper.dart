class Mapper {
  final Type as;
  final bool reverseMap;
  const Mapper({required this.as, this.reverseMap = false});
}

const mapper = Mapper(as: NoType, reverseMap: true);

final class NoType {}
