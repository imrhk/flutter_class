import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_text_world/src/lorem_ipsum.dart';

class TextTranslucentExample extends StatefulWidget {
  const TextTranslucentExample({super.key});

  @override
  State<TextTranslucentExample> createState() => _TextTranslucentExampleState();
}

class _TextTranslucentExampleState extends State<TextTranslucentExample> {
  final _gradient = const LinearGradient(colors: [Colors.pink, Colors.blue])
      .createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));

  late Paint _paint;

  var _sliderValue = 5.0;

  @override
  void initState() {
    super.initState();
    _paint = Paint()
      ..shader = _gradient
      ..imageFilter =
          ImageFilter.blur(sigmaX: _sliderValue, sigmaY: _sliderValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Translucent'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                key: ValueKey(_sliderValue),
                loremIpsum,
                style: TextStyle(fontSize: 24, foreground: _paint),
              ),
            ),
          ),
          const Text('Change Blur'),
          Slider(
              value: _sliderValue,
              max: 10.0,
              divisions: 10,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                  _paint.imageFilter = ImageFilter.blur(
                      sigmaX: _sliderValue, sigmaY: _sliderValue);
                });
              }),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
