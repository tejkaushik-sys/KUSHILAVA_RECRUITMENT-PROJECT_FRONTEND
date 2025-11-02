import 'package:flutter/material.dart';

class SpiritualRoom extends StatelessWidget {
  const SpiritualRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECE2D0),
      appBar: AppBar(
        title: const Text('🕉️ Spiritual Room'),
        backgroundColor: Colors.brown,
        titleTextStyle: const TextStyle(
          fontFamily: 'Georgia',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/7/76/Om_symbol.svg',
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to the Spiritual Room',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Here, peace meets purpose. You can later connect this page to spiritual content, quotes, or cultural stories from your backend.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Georgia', fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}