import 'package:flutter/material.dart';

class StoriesRoom extends StatelessWidget {
  const StoriesRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      appBar: AppBar(
        title: const Text('📖 Stories Room'),
        backgroundColor: Colors.brown,
      ),
      body: const Center(
        child: Text(
          'Stories of heritage, wisdom, and heart will live here soon.',
          style: TextStyle(fontFamily: 'Georgia', fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}