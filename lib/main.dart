import 'package:flutter/material.dart';
import 'screens/home_screen.dart';


void main() {
  runApp(const HeritageHomeHub());
}

class HeritageHomeHub extends StatelessWidget {
  const HeritageHomeHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heritage Home Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
        fontFamily: 'Georgia',
      ),
      home: const HomeScreen(),
    );
  }
}