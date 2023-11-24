import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/model/response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  IMediator get mediatr => Mediator();

  @singleton
  INetworkManager<ResponseModel> get manager => NetworkManager<ResponseModel>();
}
