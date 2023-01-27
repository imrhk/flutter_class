import 'package:flutter/material.dart';
import 'package:flutter_text_world/src/lorem_ipsum.dart';

class TextGradientExample extends StatefulWidget {
  const TextGradientExample({super.key});

  @override
  State<TextGradientExample> createState() => _TextGradientExampleState();
}

class _TextGradientExampleState extends State<TextGradientExample> {
  final _gradientsShaderMapEntryList = [
    [Colors.pink, Colors.blue],
    [Colors.pink, const Color(0xFFFFD700)],
    [Colors.green, Colors.orange],
    [Colors.purple, Colors.cyan],
  ]
      .map((e) => LinearGradient(
            colors: e,
          ))
      .map((e) => MapEntry(
          e, e.createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 60.0))))
      .toList();

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Gradient'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < _gradientsShaderMapEntryList.length; i++)
                InkWell(
                  onTap: () {
                    _selectedIndex = i;
                    setState(() {});
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: _gradientsShaderMapEntryList[i].key,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Builder(builder: (context) {
                      if (_selectedIndex == i) {
                        return const Icon(
                          Icons.done,
                          size: 20,
                        );
                      } else {
                        return const SizedBox.square(
                          dimension: 20,
                        );
                      }
                    }),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                loremIpsum,
                style: TextStyle(
                    fontSize: 24,
                    foreground: Paint()
                      ..shader =
                          _gradientsShaderMapEntryList[_selectedIndex].value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
