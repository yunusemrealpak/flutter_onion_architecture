import '../mapper_annotation.dart';

abstract interface class IMapper {
  T map<T>(dynamic source);
  List<T> mapList<T>(List<dynamic> source);
}
