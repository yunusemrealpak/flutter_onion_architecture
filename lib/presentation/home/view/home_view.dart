import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          body: ListView.separated(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return ListTile(
                title: Text(post.title ?? ''),
                subtitle: Text(post.body ?? ''),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }
}
