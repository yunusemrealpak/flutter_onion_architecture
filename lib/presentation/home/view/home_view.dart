import 'package:flutter/material.dart';

import '../../common/base_view.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeCubit, HomeState>(
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      builder: (context, HomeCubit cubit, HomeState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Container(),
        );
      },
    );
  }
}
