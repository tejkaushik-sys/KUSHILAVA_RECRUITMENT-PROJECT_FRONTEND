import 'package:flutter/material.dart';

class RecipesRoom extends StatelessWidget {
  const RecipesRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDEDEC),
      appBar: AppBar(
        title: const Text('🍲 Recipes Room'),
        backgroundColor: Colors.brown,
      ),
      body: const Center(
        child: Text(
          'A pinch of love, a spoon of tradition — recipes will appear here.',
          style: TextStyle(fontFamily: 'Georgia', fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}