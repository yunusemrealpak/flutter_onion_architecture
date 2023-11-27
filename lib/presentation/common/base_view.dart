import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection/get_it_container.dart';
import 'base_cubit.dart';
import 'base_cubit_state.dart';

/// A base widget for implementing the Onion Architecture in Flutter.
///
/// The [BaseView] widget is used as a foundation for creating views that follow the Onion Architecture pattern.
/// It provides a convenient way to integrate a [BaseCubit] and its corresponding [BaseCubitState] into the widget tree.
///
/// The [BaseView] widget takes a [builder] function that is responsible for building the UI based on the current [BaseCubitState].
/// It also allows optional [listener] and [onCubitReady] functions to be provided for additional customization.
///
/// Example usage:
/// ```dart
/// BaseView<MyCubit, MyCubitState>(
///   builder: (context, cubit, state) {
///     // Build UI based on the current state
///   },
///   listener: (context, cubit, state) {
///     // Perform side effects based on the current state
///   },
///   onCubitReady: (cubit) {
///     // Perform initialization logic when the cubit is ready
///   },
/// )
/// ```
class BaseView<T extends BaseCubit<R>, R extends BaseCubitState> extends StatefulWidget {
  const BaseView({
    required this.builder,
    super.key,
    this.listener,
    this.listenWhen,
    this.onCubitReady,
  });

  /// A function that builds the UI based on the current [BaseCubitState].
  final Widget Function(BuildContext context, T cubit, R state) builder;

  /// An optional function that determines whether the [listener] should be called based on the previous and current [BaseCubitState].
  final bool Function(R, R)? listenWhen;

  /// An optional function that is called whenever the [BaseCubitState] changes.
  final void Function(BuildContext context, T cubit, R state)? listener;

  /// An optional function that is called when the [BaseCubit] is ready.
  final void Function(T cubit)? onCubitReady;

  @override
  State<BaseView> createState() => _BaseViewState<T, R>();
}

class _BaseViewState<T extends BaseCubit<R>, R extends BaseCubitState> extends State<BaseView<T, R>> {
  late T cubit;

  @override
  void initState() {
    super.initState();

    cubit = di<T>();
    widget.onCubitReady?.call(cubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<T, R>(
        builder: (context, state) {
          return widget.builder(context, cubit, state);
        },
        listenWhen: widget.listenWhen,
        listener: (context, state) {
          final cubit = context.read<T>();
          if (widget.listener != null) {
            return widget.listener!(context, cubit, state);
          }
        },
      ),
    );
  }
}
