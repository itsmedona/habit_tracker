import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const HabApp());
}

class HabApp extends StatelessWidget {
  const HabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
