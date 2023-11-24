// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../core/application/dto/product_dto.dart' as _i4;
import '../../core/application/features/product/commands/create_product/create_product_command.dart'
    as _i2;
import '../../core/domain/entities/product.dart' as _i3;

/// {@template package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
/// Available mappings:
/// - `CreateProductCommand` → `Product`.
/// - `Product` → `ProductDto`.
/// - `ProductDto` → `Product`.
/// {@endtemplate}
class $AutoMapper implements _i1.AutoMapprInterface {
  const $AutoMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.CreateProductCommand>() ||
            sourceTypeOf == _typeOf<_i2.CreateProductCommand?>()) &&
        (targetTypeOf == _typeOf<_i3.Product>() ||
            targetTypeOf == _typeOf<_i3.Product?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Product>() ||
            sourceTypeOf == _typeOf<_i3.Product?>()) &&
        (targetTypeOf == _typeOf<_i4.ProductDto>() ||
            targetTypeOf == _typeOf<_i4.ProductDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.ProductDto>() ||
            sourceTypeOf == _typeOf<_i4.ProductDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Product>() ||
            targetTypeOf == _typeOf<_i3.Product?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
      Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>((item) => _convert(item, canReturnNull: true));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.CreateProductCommand>() ||
            sourceTypeOf == _typeOf<_i2.CreateProductCommand?>()) &&
        (targetTypeOf == _typeOf<_i3.Product>() ||
            targetTypeOf == _typeOf<_i3.Product?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CreateProductCommand_To__i3$Product(
          (model as _i2.CreateProductCommand?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Product>() ||
            sourceTypeOf == _typeOf<_i3.Product?>()) &&
        (targetTypeOf == _typeOf<_i4.ProductDto>() ||
            targetTypeOf == _typeOf<_i4.ProductDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Product_To__i4$ProductDto((model as _i3.Product?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.ProductDto>() ||
            sourceTypeOf == _typeOf<_i4.ProductDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Product>() ||
            targetTypeOf == _typeOf<_i3.Product?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$ProductDto_To__i3$Product((model as _i4.ProductDto?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.Product _map__i2$CreateProductCommand_To__i3$Product(
      _i2.CreateProductCommand? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CreateProductCommand → Product failed because CreateProductCommand was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CreateProductCommand, Product> to handle null values during mapping.');
    }
    return _i3.Product(
      name: model.name,
      price: model.price,
      stock: model.stock,
    );
  }

  _i4.ProductDto _map__i3$Product_To__i4$ProductDto(_i3.Product? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Product → ProductDto failed because Product was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Product, ProductDto> to handle null values during mapping.');
    }
    return _i4.ProductDto(
      name: model.name,
      price: model.price,
    );
  }

  _i3.Product _map__i4$ProductDto_To__i3$Product(_i4.ProductDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ProductDto → Product failed because ProductDto was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ProductDto, Product> to handle null values during mapping.');
    }
    return _i3.Product(
      name: model.name,
      price: model.price,
    );
  }
}
