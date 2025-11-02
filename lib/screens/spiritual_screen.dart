import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SpiritualScreen extends StatefulWidget {
  const SpiritualScreen({super.key});

  @override
  State<SpiritualScreen> createState() => _SpiritualScreenState();
}

class _SpiritualScreenState extends State<SpiritualScreen> {
  AudioPlayer? player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      player = AudioPlayer();
    }
  }

  Future<void> _toggleAudio() async {
    if (kIsWeb) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Audio works only on mobile demo right now")),
      );
      return;
    }

    if (isPlaying) {
      await player?.pause();
    } else {
      await player?.play(
        UrlSource('https://pagalworld.nl/files/download/id/64636'),
      );
    }
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spiritual Space")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.self_improvement, size: 100, color: Colors.brown),
            const SizedBox(height: 20),
            const Text(
              "Experience Peaceful Bhajans",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _toggleAudio,
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(isPlaying ? "Pause" : "Play Bhajan"),
            ),
          ],
        ),
      ),
    );
  }
}