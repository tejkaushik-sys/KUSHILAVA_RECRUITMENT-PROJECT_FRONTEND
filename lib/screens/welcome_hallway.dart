// welcome_hallway.dart - choose region and enter home
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/theme_loader.dart';
import '../models/theme_model.dart';
import 'home_screen.dart';

class WelcomeHallway extends StatefulWidget {
  const WelcomeHallway({Key? key}) : super(key: key);
  @override
  State<WelcomeHallway> createState() => _WelcomeHallwayState();
}

class _WelcomeHallwayState extends State<WelcomeHallway> {
  String? _selectedRegion;
  bool _loading = false;

  final List<Map<String, String>> regions = const [
    {'id': 'global', 'label': 'Global Home', 'hint': 'Warm, wooden, universal'},
    {'id': 'north', 'label': 'North India', 'hint': 'Bright & festive'},
    {'id': 'south', 'label': 'South India', 'hint': 'Serene & temple-like'},
    {'id': 'east', 'label': 'East India', 'hint': 'Art & textiles'},
    {'id': 'west', 'label': 'West India', 'hint': 'Bold & mirrorwork'},
  ];

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final p = await SharedPreferences.getInstance();
    final saved = p.getString('selected_region');
    if (saved != null && saved.isNotEmpty) {
      setState(() => _selectedRegion = saved);
      await Future.delayed(const Duration(milliseconds: 300));
      _enterHome(saved);
    }
  }

  Future<void> _saveAndEnter(String id) async {
    setState(() => _loading = true);
    final p = await SharedPreferences.getInstance();
    await p.setString('selected_region', id);
    await Future.delayed(const Duration(milliseconds: 250));
    if (!mounted) return;
    _enterHome(id);
  }

  Future<void> _enterHome(String id) async {
    ThemeModel theme;
    try {
      theme = await ThemeLoader.loadGlobal(); // for now always global
    } catch (_) {
      theme = ThemeModel(id: 'global', displayName: 'Global Home', primaryColor: '#C4A484', accentColor: '#5A4634', roomImages: {'Kitchen': 'https://picsum.photos/seed/fallback/800/600'}, sounds: {});
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen(theme: theme)));
  }

  Widget _card(Map<String, String> r) {
    final id = r['id']!;
    final selected = _selectedRegion == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedRegion = id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: selected ? Colors.brown.shade50 : Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: selected ? Colors.brown : Colors.grey.withOpacity(0.12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(r['label']!, style: TextStyle(fontWeight: FontWeight.w600, color: selected ? Colors.brown.shade700 : Colors.black)),
            const SizedBox(height: 6),
            Text(r['hint']!, style: const TextStyle(color: Colors.black54, fontSize: 12)),
            const Spacer(),
            Align(alignment: Alignment.bottomRight, child: Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? Colors.brown : Colors.grey))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome Hallway'), backgroundColor: Colors.brown.shade600),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            const Text('Welcome!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Pick a region to style your Heritage Home (you can change this later).', style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
                children: regions.map((r) => _card(r)).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (_selectedRegion == null || _loading) ? null : () => _saveAndEnter(_selectedRegion!),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown.shade600, padding: const EdgeInsets.symmetric(vertical: 14)),
                child: _loading ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text('Enter Home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}