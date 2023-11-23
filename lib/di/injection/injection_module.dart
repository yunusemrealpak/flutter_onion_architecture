import 'package:injectable/injectable.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:mediatr/mediatr.dart';

import '../mapping/auto_mapper.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  IMediator get manager => Mediator();

  @lazySingleton
  IMapper get mapper => AutoMapper();
}
