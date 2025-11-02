import 'package:flutter/material.dart';

class SkillsRoom extends StatelessWidget {
  const SkillsRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F7EF),
      appBar: AppBar(
        title: const Text('🎨 Skills Room'),
        backgroundColor: Colors.brown,
      ),
      body: const Center(
        child: Text(
          'Display crafts, arts, or family skills here!',
          style: TextStyle(fontFamily: 'Georgia', fontSize: 16),
        ),
      ),
    );
  }
}