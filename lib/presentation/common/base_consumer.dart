// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_cubit.dart';
import 'base_cubit_state.dart';

/// A widget that consumes a [BaseCubit] and rebuilds when the [BaseCubitState] changes.
///
/// The [BaseConsumer] takes in a [BuildContext], a [builder] function, and optional parameters
/// [listenWhen], [listener], and [onCubitReady].
///
/// The [builder] function is called whenever the [BaseCubitState] changes and is responsible for
/// building the UI based on the current [BuildContext], [BaseCubit], and [BaseCubitState].
///
/// The [listenWhen] parameter is an optional function that determines whether the [listener]
/// should be called based on the previous and current [BaseCubitState]. If not provided, the
/// [listener] will be called for every state change.
///
/// The [listener] parameter is an optional function that is called whenever the [BaseCubitState]
/// changes. It is responsible for handling side effects such as showing a snackbar or navigating
/// to a different screen.
///
/// The [onCubitReady] parameter is an optional function that is called after the [BaseCubit] is
/// initialized and ready to be used. It can be used to perform any necessary setup or initialization
/// logic.
///
/// Example usage:
/// ```dart
/// BaseConsumer<MyCubit, MyState>(
///   context,
///   builder: (context, cubit, state) {
///     return Text(state.data);
///   },
///   listener: (context, state) {
///     if (state is ErrorState) {
///       ScaffoldMessenger.of(context).showSnackBar(
///         SnackBar(content: Text('An error occurred')),
///       );
///     }
///   },
/// )
/// ```
class BaseConsumer<T extends BaseCubit<R>, R extends BaseCubitState> extends StatefulWidget {
  final BuildContext context;
  final Widget Function(BuildContext context, T cubit, R state) builder;
  final bool Function(R, R)? listenWhen;
  final void Function(BuildContext context, T cubit, R state)? listener;
  final void Function(T cubit)? onCubitReady;

  /// Creates a [BaseConsumer] widget.
  ///
  /// The [context] parameter is the [BuildContext] in which the [BaseConsumer] is being used.
  ///
  /// The [builder] parameter is a function that takes in the [BuildContext], [BaseCubit], and
  /// [BaseCubitState] and returns a widget that represents the UI based on the current state.
  ///
  /// The [listenWhen] parameter is an optional function that determines whether the [listener]
  /// should be called based on the previous and current [BaseCubitState]. If not provided, the
  /// [listener] will be called for every state change.
  ///
  /// The [listener] parameter is an optional function that is called whenever the [BaseCubitState]
  /// changes. It is responsible for handling side effects such as showing a snackbar or navigating
  /// to a different screen.
  ///
  /// The [onCubitReady] parameter is an optional function that is called after the [BaseCubit] is
  /// initialized and ready to be used. It can be used to perform any necessary setup or initialization
  /// logic.
  const BaseConsumer(
    this.context, {
    required this.builder,
    super.key,
    this.listenWhen,
    this.listener,
    this.onCubitReady,
  });

  @override
  State<BaseConsumer<T, R>> createState() => _BaseConsumerState<T, R>();
}

class _BaseConsumerState<T extends BaseCubit<R>, R extends BaseCubitState> extends State<BaseConsumer<T, R>> {
  late BuildContext baseContext;
  late T cubit;

  @override
  void initState() {
    super.initState();
    baseContext = widget.context;
    cubit = baseContext.read<T>();
    widget.onCubitReady?.call(cubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, R>(
      builder: (context, state) {
        return widget.builder(baseContext, cubit, state);
      },
      listenWhen: widget.listenWhen,
      listener: (context, state) {
        if (widget.listener != null) {
          return widget.listener!(baseContext, cubit, state);
        }
      },
    );
  }
}
