// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../core/application/dto/post_dto.dart' as _i4;
import '../../core/application/features/post/commands/create_post/create_post_command.dart'
    as _i2;
import '../../core/domain/entities/post.dart' as _i3;

/// {@template package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
/// Available mappings:
/// - `CreatePostCommand` → `Post`.
/// - `Post` → `PostDto`.
/// - `PostDto` → `Post`.
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
    if ((sourceTypeOf == _typeOf<_i2.CreatePostCommand>() ||
            sourceTypeOf == _typeOf<_i2.CreatePostCommand?>()) &&
        (targetTypeOf == _typeOf<_i3.Post>() ||
            targetTypeOf == _typeOf<_i3.Post?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Post>() ||
            sourceTypeOf == _typeOf<_i3.Post?>()) &&
        (targetTypeOf == _typeOf<_i4.PostDto>() ||
            targetTypeOf == _typeOf<_i4.PostDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.PostDto>() ||
            sourceTypeOf == _typeOf<_i4.PostDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Post>() ||
            targetTypeOf == _typeOf<_i3.Post?>())) {
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
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(
        model,
        onMappingError: onMappingError,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(
          model,
          onMappingError: onMappingError,
        );
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
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
          (item) => _safeConvert(item, onMappingError: onMappingError));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(
          model,
          onMappingError: onMappingError,
        );
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
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(
          model,
          onMappingError: onMappingError,
        );
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
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(
          model,
          onMappingError: onMappingError,
        );
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
    if ((sourceTypeOf == _typeOf<_i2.CreatePostCommand>() ||
            sourceTypeOf == _typeOf<_i2.CreatePostCommand?>()) &&
        (targetTypeOf == _typeOf<_i3.Post>() ||
            targetTypeOf == _typeOf<_i3.Post?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CreatePostCommand_To__i3$Post(
          (model as _i2.CreatePostCommand?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Post>() ||
            sourceTypeOf == _typeOf<_i3.Post?>()) &&
        (targetTypeOf == _typeOf<_i4.PostDto>() ||
            targetTypeOf == _typeOf<_i4.PostDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Post_To__i4$PostDto((model as _i3.Post?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.PostDto>() ||
            sourceTypeOf == _typeOf<_i4.PostDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Post>() ||
            targetTypeOf == _typeOf<_i3.Post?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$PostDto_To__i3$Post((model as _i4.PostDto?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    try {
      return _convert(
        model,
        canReturnNull: true,
      );
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:flutter_onion_architecture/di/mapping/auto_mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.Post _map__i2$CreatePostCommand_To__i3$Post(
      _i2.CreatePostCommand? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CreatePostCommand → Post failed because CreatePostCommand was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CreatePostCommand, Post> to handle null values during mapping.');
    }
    return _i3.Post(
      title: model.title,
      body: model.body,
    );
  }

  _i4.PostDto _map__i3$Post_To__i4$PostDto(_i3.Post? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Post → PostDto failed because Post was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Post, PostDto> to handle null values during mapping.');
    }
    return _i4.PostDto(
      id: model.id,
      userId: model.userId,
      title: model.title,
      body: model.body,
    );
  }

  _i3.Post _map__i4$PostDto_To__i3$Post(_i4.PostDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping PostDto → Post failed because PostDto was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<PostDto, Post> to handle null values during mapping.');
    }
    return _i3.Post(
      userId: model.userId,
      id: model.id,
      title: model.title,
      body: model.body,
    );
  }
}
