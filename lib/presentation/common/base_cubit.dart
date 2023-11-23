import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onion_architecture/common/extensions/context_extensions.dart';

import '../../common/constants/app_constants.dart';

abstract base class BaseCubit<T> extends Cubit<T> {
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

  void setLoading(bool loading) {}

  void resetFailure() {
    if (kDebugMode) {
      print(
        "State'inde failure objesi bulundurmalısın ve bu metodu override etmelisin.",
      );
    }
  }
}
