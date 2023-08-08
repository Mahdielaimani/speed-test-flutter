import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_data.dart';
import 'views/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: App()),
  );
}

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return MaterialApp(
      title: 'Internet Speed',
      theme: appThemeData,
      home: const HomeScreen(),
    );
  }
}
