// splash_home.dart - small animation + wind-chime + forward to WelcomeHallway
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/theme_loader.dart';
import 'welcome_hallway.dart';
import '../models/theme_model.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);
  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> with SingleTickerProviderStateMixin {
  ThemeModel? theme;
  late final AnimationController _controller;
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    final t = await ThemeLoader.loadGlobal();
    setState(() => theme = t);
    final s = t.sounds['entry'];
    if (s != null && s.isNotEmpty) {
      try {
        await _player.play(UrlSource(s));
      } catch (_) {}
    }
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const WelcomeHallway()));
  }

  @override
  void dispose() {
    _player.dispose();
    _controller.dispose();
    super.dispose();
  }

  Color _hex(String hex) {
    final s = hex.replaceAll('#', '');
    return Color(int.parse('FF$s', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final bg = const Color(0xFFFBF6F0);
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: theme == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 260,
                    height: 160,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(theme!.roomImages.values.first, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text('Heritage Home Hub', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: _hex(theme!.primaryColor))),
                  const SizedBox(height: 6),
                  Text(theme!.displayName, style: const TextStyle(color: Colors.black54)),
                ],
              ),
      ),
    );
  }
}