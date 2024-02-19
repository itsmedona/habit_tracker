import 'package:flutter/material.dart';
import 'package:habit_track/view/HomePage.dart';
import 'package:habit_track/view/Themes/ThemeCheck_provider.dart';
import 'package:provider/provider.dart';

void main() {
  ChangeNotifierProvider(
      create: (context) => ThemeProvider(), 
      child:HabApp());
}

class HabApp extends StatelessWidget {
  const HabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
