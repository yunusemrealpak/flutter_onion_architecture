import 'package:flutter/material.dart';
import 'package:flutter_onion_architecture/di/injection/get_it_container.dart';
import 'package:flutter_onion_architecture/presentation/home/view/home_view.dart';
import 'package:mediatr/mediatr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetItContainer.configureDependencies();
  MediatorInjector().register(GetItContainer.instance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
