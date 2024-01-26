import 'package:flutter/material.dart';
import 'package:flutter_onion_architecture/di/injection/get_it_container.dart';
import 'package:flutter_onion_architecture/presentation/home/view/home_view.dart';
import 'package:mediatr/mediatr.dart';

/// This is the main entry point of the application.
/// It initializes the Flutter binding and configures the dependencies using GetItContainer.
/// It also subscribes the MediatorInjector to the GetItContainer instance.
/// Finally, it runs the `MyApp` widget as the root of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the dependencies
  GetItContainer.configureDependencies();

  // Subscribe the MediatorInjector to the GetItContainer instance
  MediatorInjector().subscribe(GetItContainer.instance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onion Architecture Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
