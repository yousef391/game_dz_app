import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Splash/Presentation/views/splash_screen.dart';
import 'package:game_dz_app/core/helper_function/Route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routename, // Set initial route
      onGenerateRoute: onGenerateRoute, // Use dynamic routing
    );
  }
}