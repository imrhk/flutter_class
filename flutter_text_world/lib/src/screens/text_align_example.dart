import 'package:flutter/material.dart';

import '../lorem_ipsum.dart';

class TextAlignExample extends StatefulWidget {
  const TextAlignExample({super.key});

  @override
  State<TextAlignExample> createState() => _TextAlignExampleState();
}

class _TextAlignExampleState extends State<TextAlignExample> {
  var _currentSegmentIndex = 0;
  final _currentTextDirection = TextDirection.ltr;

  TextAlign? get _textAlign {
    switch (_currentSegmentIndex) {
      case 0:
        return TextAlign.start;
      case 1:
        return TextAlign.center;
      case 2:
        return TextAlign.end;
      case 3:
        return TextAlign.justify;
      default:
        assert(false, '$_currentSegmentIndex is not mapped to TextAlign');
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Align'),
      ),
      body: Center(
        child: Column(
          children: [
            SegmentedButton(
              segments: const [
                ButtonSegment(value: 0, label: Text('Start')),
                ButtonSegment(value: 1, label: Text('Center')),
                ButtonSegment(value: 2, label: Text('End')),
                ButtonSegment(value: 3, label: Text('Justifed')),
              ],
              showSelectedIcon: false,
              onSelectionChanged: (newValue) {
                _currentSegmentIndex = newValue.first;
                setState(() {});
              },
              selected: {_currentSegmentIndex},
              multiSelectionEnabled: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              loremIpsum,
              style: const TextStyle(fontSize: 24),
              textAlign: _textAlign,
              textDirection: _currentTextDirection,
            ),
          ],
        ),
      ),
    );
  }
}
