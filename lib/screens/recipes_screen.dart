import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = [
      "Grandma’s Butter Chicken",
      "South Indian Dosa Batter",
      "Punjabi Kadhi",
      "Traditional Modak",
      "Rajasthani Dal Baati"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Traditional Recipes")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.restaurant),
          title: Text(recipes[index]),
          subtitle: const Text("Tap to learn this recipe soon!"),
        ),
      ),
    );
  }
}