import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onion_architecture/common/extensions/context_extensions.dart';

import '../../common/constants/app_constants.dart';

/// This is an abstract base class for Cubit classes in the application.
/// It provides common functionality and methods that can be used by
/// subclasses.
///
/// Parameters:
/// - T: The type of state that the Cubit emits.
///
/// Properties:
/// - context: The BuildContext object used for showing notifications.
///
/// Methods:
/// - setContext(BuildContext context): Sets the BuildContext object.
/// - safeEmit(T state): Emits the given state if the Cubit is not closed.
/// - showNotification(String message, {bool isError = false, Duration duration = const Duration(milliseconds: 4000)}):
///   Shows a notification using the ScaffoldMessenger.
/// - setError(String? message): Shows an error notification with the given message.
/// - setLoading(bool loading): Sets the loading state of the Cubit.
/// - resetFailure(): Resets the failure state of the Cubit.
abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);

  late BuildContext context;
  BuildContext setContext(BuildContext context) => this.context = context;

  void safeEmit(T state) {
    if (isClosed) return;
    emit(state);
  }

  void showNotification(String message, {bool isError = false, Duration duration = const Duration(milliseconds: 4000)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: isError ? Colors.red.shade900 : Colors.green.shade900,
        margin: context.paddingNormal,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.kBorderRadius),
          ),
        ),
      ),
    );
  }

  void setError(String? message) {
    showNotification(message ?? '', isError: true);
  }

  /// Sets the loading state of the home cubit.
  ///
  /// This method updates the loading state of the home cubit by
  /// modifying the `isLoading` property of the current state.
  /// The new state is then emitted using the `safeEmit` method.
  ///
  /// Parameters:
  /// - loading: A boolean value indicating whether the home is loading or not.
  ///
  /// Returns: void
  void setLoading(bool loading) {}

  void resetFailure() {
    if (kDebugMode) {
      print(
        "State'inde failure objesi bulundurmalısın ve bu metodu override etmelisin.",
      );
    }
  }
}
