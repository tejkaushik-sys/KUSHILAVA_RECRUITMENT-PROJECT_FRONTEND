// room_screen.dart - generic room: lists items and allows create for Kitchen
import 'package:flutter/material.dart';
import '../models/theme_model.dart';
import '../services/api_service.dart';
import 'create_recipe_screen.dart';

class RoomScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final ThemeModel theme;

  const RoomScreen({super.key, required this.title, required this.imageUrl, required this.theme});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool loading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => loading = true);
    try {
      final titleLower = widget.title.toLowerCase();
      if (titleLower.contains('kitchen') || titleLower.contains('recipe')) {
        final r = await ApiService.getRecipes();
        setState(() => items = r ?? []);
      } else if (titleLower.contains('stories')) {
        final r = await ApiService.getStories();
        setState(() => items = r ?? []);
      } else if (titleLower.contains('spiritual')) {
        final r = await ApiService.getSpiritual();
        setState(() => items = r ?? []);
      } else {
        setState(() => items = []);
      }
    } catch (_) {
      setState(() => items = []);
    } finally {
      setState(() => loading = false);
    }
  }

  Widget _itemTile(dynamic it) {
    final title = it['title'] ?? 'Untitled';
    final subtitle = it['description'] ?? it['content'] ?? '';
    final author = it['author']?['name'] ?? '';
    return ListTile(title: Text(title), subtitle: Text(subtitle), trailing: Text(author));
  }

  @override
  Widget build(BuildContext context) {
    final primary = Color(int.parse('FF${widget.theme.primaryColor.replaceAll('#', '')}', radix: 16));
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: primary),
      body: loading ? const Center(child: CircularProgressIndicator()) : items.isEmpty ? const Center(child: Text('No items yet')) : ListView.builder(itemCount: items.length, itemBuilder: (_, i) => _itemTile(items[i])),
      floatingActionButton: widget.title.toLowerCase().contains('kitchen') ? FloatingActionButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateRecipeScreen())).then((_) => _load()), child: const Icon(Icons.add)) : null,
    );
  }
}