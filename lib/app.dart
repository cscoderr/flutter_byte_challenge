import 'package:flutter/material.dart';
import 'package:flutter_byte_challenge/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'GigaSans',
            fontWeight: FontWeight.w600,
            letterSpacing: -5.5,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
