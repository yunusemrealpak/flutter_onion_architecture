import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/model/response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:mediatr/mediatr.dart';

import '../mapping/auto_mapper.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  IMediator get mediatr => Mediator();

  @lazySingleton
  IMapper get mapper => AutoMapper();

  @singleton
  INetworkManager get manager => NetworkManager<ResponseModel>();
}
