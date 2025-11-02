// create_recipe_screen.dart - small form to create a recipe (POST to backend)
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({Key? key}) : super(key: key);
  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _title = TextEditingController();
  final _desc = TextEditingController();
  bool saving = false;

  Future<void> _save() async {
    setState(() => saving = true);
    final payload = {'title': _title.text.trim(), 'description': _desc.text.trim(), 'ingredients': [], 'steps': []};
    final res = await ApiService.createRecipe(payload);
    setState(() => saving = false);
    if (res != null) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to create')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(controller: _title, decoration: const InputDecoration(labelText: 'Title')),
            const SizedBox(height: 10),
            TextField(controller: _desc, decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: saving ? null : _save, child: saving ? const CircularProgressIndicator() : const Text('Save'))
          ],
        ),
      ),
    );
  }
}