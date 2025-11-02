import 'package:flutter/material.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      "The Old Banyan Tree Legend",
      "How Grandpa Built His First Radio",
      "The Festival of Lights in 1970",
      "Village Fair Memories"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Family Stories")),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(stories[index],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("A cherished story from our roots."),
          ),
        ),
      ),
    );
  }
}