import 'package:flutter/material.dart';
import 'package:flutter_text_world/src/lorem_ipsum.dart';

class SelectableTextExample extends StatelessWidget {
  const SelectableTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Text'),
      ),
      body: const Center(
        child: SelectableText(
          loremIpsum,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
