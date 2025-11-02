import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      "Hand Embroidery",
      "Clay Pottery",
      "Rangoli Making",
      "Homemade Pickles",
      "Weaving & Stitching"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Traditional Skills")),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.handyman_outlined),
          title: Text(skills[index]),
          subtitle: const Text("Click to learn and share soon!"),
        ),
      ),
    );
  }
}