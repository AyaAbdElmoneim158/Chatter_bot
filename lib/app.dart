import 'package:chatter_bot/utils/routing/routes.dart';
import 'package:flutter/material.dart';
import 'utils/routing/router.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatterBot app',
      debugShowCheckedModeBanner: false,
      // Theme - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      // Route - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      initialRoute: AppRoutes.splashRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      // home: const SplashScreen(),
    );
  }
}
