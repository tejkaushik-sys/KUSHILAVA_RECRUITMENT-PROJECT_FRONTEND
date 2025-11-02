import 'package:flutter/material.dart';
import 'recipes_screen.dart';
import 'stories_screen.dart';
import 'skills_screen.dart';
import 'spiritual_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf3e0),
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: const Text(
          "🏠 Heritage Home Hub",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildCard(context, "Recipes", Icons.restaurant_menu, const RecipesScreen()),
          _buildCard(context, "Stories", Icons.auto_stories, const StoriesScreen()),
          _buildCard(context, "Skills", Icons.handyman, const SkillsScreen()),
          _buildCard(context, "Spiritual", Icons.self_improvement, const SpiritualScreen()),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Card(
        color: Colors.brown[100],
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.brown[700]),
              const SizedBox(height: 10),
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[800])),
            ],
          ),
        ),
      ),
    );
  }
}