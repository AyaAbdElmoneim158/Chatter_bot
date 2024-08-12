import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "🤖 💭 ChatterBot app",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
