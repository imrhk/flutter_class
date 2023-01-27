import 'package:flutter/material.dart';

import '../lorem_ipsum.dart';

class TextOverflowExample extends StatefulWidget {
  const TextOverflowExample({super.key});

  @override
  State<TextOverflowExample> createState() => _TextOverflowExampleState();
}

class _TextOverflowExampleState extends State<TextOverflowExample> {
  var _currentSegmentIndex = 0;

  TextOverflow? get _textOverflow {
    switch (_currentSegmentIndex) {
      case 0:
        return null;
      case 1:
        return TextOverflow.visible;
      case 2:
        return TextOverflow.clip;
      case 3:
        return TextOverflow.fade;
      case 4:
        return TextOverflow.ellipsis;
      default:
        assert(false, '$_currentSegmentIndex is not mapped to TextOverflow');
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Overflow'),
      ),
      body: Center(
        child: Column(
          children: [
            SegmentedButton(
              segments: const [
                ButtonSegment(value: 0, label: Text('Default')),
                ButtonSegment(value: 1, label: Text('Visible')),
                ButtonSegment(value: 2, label: Text('Clip')),
                ButtonSegment(value: 3, label: Text('Fade')),
                ButtonSegment(value: 4, label: Text('Ellipsis')),
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
            SizedBox(
              width: 200,
              child: Text(
                loremIpsum,
                maxLines: 4,
                overflow: _textOverflow,
                softWrap: false,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
