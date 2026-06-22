import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: SpotifyColors.background,
        primaryColor: SpotifyColors.primaryGreen,
        fontFamily: 'Roboto', // Default fallback font, Spotify uses Circular.
        colorScheme: const ColorScheme.dark(
          primary: SpotifyColors.primaryGreen,
          surface: SpotifyColors.background,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
