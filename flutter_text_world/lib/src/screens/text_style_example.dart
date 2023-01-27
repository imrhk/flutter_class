import 'package:flutter/material.dart';

import '../lorem_ipsum.dart';

class TextStyleExample extends StatefulWidget {
  const TextStyleExample({super.key});

  @override
  State<TextStyleExample> createState() => _TextStyleExampleState();
}

class _TextStyleExampleState extends State<TextStyleExample> {
  var _currentPageIndex = 0;
  var _showOriginal = false;

  final _data = const <String, TextStyle>{
    "Text Color": TextStyle(color: Colors.purple),
    "Background Color": TextStyle(backgroundColor: Colors.lime),
    "Underline": TextStyle(decoration: TextDecoration.underline),
    "Strikethrough": TextStyle(decoration: TextDecoration.lineThrough),
    "Overline": TextStyle(decoration: TextDecoration.overline),
    "Red Underline": TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: Colors.red,
    ),
    "Squiggly Red Underline": TextStyle(
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.wavy,
      decorationColor: Colors.red,
    ),
    "Double Red Linethrough": TextStyle(
      decoration: TextDecoration.lineThrough,
      decorationStyle: TextDecorationStyle.double,
      decorationColor: Colors.red,
    ),
    "Dotted Red Linethrough": TextStyle(
      decoration: TextDecoration.lineThrough,
      decorationStyle: TextDecorationStyle.dotted,
      decorationColor: Colors.red,
    ),
    "Dashed Red Linethrough": TextStyle(
      decoration: TextDecoration.lineThrough,
      decorationStyle: TextDecorationStyle.dashed,
      decorationColor: Colors.red,
    ),
    "Thick Red Underline": TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: Colors.red,
      decorationThickness: 3,
    ),
    "Italics": TextStyle(fontStyle: FontStyle.italic),
    "Text Shadows": TextStyle(
      shadows: [
        Shadow(
          blurRadius: 5,
          offset: Offset(0.5, 0.5),
        ),
        Shadow(
          color: Colors.blue,
          blurRadius: 5,
          offset: Offset(0.6, 0.6),
        ),
      ],
    ),
    "Word Spacing": TextStyle(wordSpacing: 2),
    "Negative Word Spacing": TextStyle(wordSpacing: -2),
    "Letter Spacing": TextStyle(
      letterSpacing: 2,
    ),
    //https://flutter.github.io/assets-for-api-docs/assets/painting/text_height_comparison_diagram.png
    "Height": TextStyle(height: 2),
  }.entries.toList();

  @override
  Widget build(BuildContext context) {
    final appBarTitle = _data[_currentPageIndex].key;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: PageView.builder(
        onPageChanged: (newPageIndex) {
          _currentPageIndex = newPageIndex;
          _showOriginal = false;
          setState(() {});
        },
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final textStyle = _showOriginal
              ? const TextStyle(fontSize: 24)
              : _data[_currentPageIndex].value.copyWith(fontSize: 24);

          return GestureDetector(
            onTapDown: (_) {
              _showOriginal = true;
              setState(() {});
            },
            onTapUp: (_) {
              _showOriginal = false;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Text(
                loremIpsum,
                style: textStyle,
              ),
            ),
          );
        },
        itemCount: _data.length,
      ),
    );
  }
}
