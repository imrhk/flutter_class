import 'package:flutter/material.dart';

import '../lorem_ipsum.dart';

class TextRTLExample extends StatefulWidget {
  const TextRTLExample({super.key});

  @override
  State<TextRTLExample> createState() => _TextRTLExampleState();
}

class _TextRTLExampleState extends State<TextRTLExample> {
  var _direction = TextDirection.rtl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _direction == TextDirection.rtl
            ? const Text('Right-to-Left')
            : const Text('Left-to-Right'),
        actions: [
          Switch.adaptive(
              value: _direction == TextDirection.rtl,
              onChanged: (newValue) {
                if (newValue) {
                  _direction = TextDirection.rtl;
                } else {
                  _direction = TextDirection.ltr;
                }
                setState(() {});
              })
        ],
      ),
      body: Center(
        child: Text(
          loremIpsum,
          style: const TextStyle(fontSize: 24),
          textDirection: _direction,
        ),
      ),
    );
  }
}
