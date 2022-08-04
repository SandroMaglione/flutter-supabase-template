import 'package:flutter/material.dart';

/// Entry widget of the app
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Supabase Complete',
      home: Placeholder(),
    );
  }
}
