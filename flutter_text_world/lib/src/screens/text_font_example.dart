import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../lorem_ipsum.dart';

class TextFontExample extends StatefulWidget {
  const TextFontExample({super.key});

  @override
  State<TextFontExample> createState() => _TextFontExampleState();
}

class _TextFontExampleState extends State<TextFontExample> {
  var _currentTitle = "Font Size: 32px";
  var _currentSegmentIndex = 0;

  String? get _currentFontFamily {
    switch (_currentSegmentIndex) {
      case 0:
        return DefaultTextStyle.of(context).style.fontFamily;
      case 1:
        return GoogleFonts.abel().fontFamily;
      case 2:
        return "FiraSansCondensed";
      case 3:
        return "Sono";
      case 4:
        return "Poppins";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
      ),
      body: Column(
        children: [
          SegmentedButton<int>(
            multiSelectionEnabled: false,
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(
                value: 0,
                label: Text('Default'),
              ),
              ButtonSegment(
                value: 1,
                label: Text('Google Font'),
              ),
              ButtonSegment(
                value: 2,
                label: Text('Regular'),
              ),
              ButtonSegment(
                value: 3,
                label: Text('Variable'),
              ),
              ButtonSegment(
                value: 4,
                label: Text('Package'),
              ),
            ],
            selected: {_currentSegmentIndex},
            onSelectionChanged: (newValue) {
              _currentSegmentIndex = newValue.first;
              setState(() {});
            },
          ),
          const SizedBox(height: 20),
          Text(
            _currentFontFamily ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
            child: _TextFontPagedView(
              fontFamily: _currentFontFamily,
              onTitleChanged: (value) {
                setState(() {
                  _currentTitle = value;
                });
              },
              isVariableFont: _currentSegmentIndex == 3,
              fontPackage:
                  _currentSegmentIndex == 4 ? "external_font_plugin" : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextFontPagedView extends StatelessWidget {
  final String? fontFamily;
  final ValueChanged<String>? onTitleChanged;
  final bool isVariableFont;
  final String? fontPackage;

  const _TextFontPagedView({
    this.fontFamily,
    this.onTitleChanged,
    this.isVariableFont = false,
    this.fontPackage,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (newValue) {
        if (onTitleChanged == null) {
          return;
        }
        switch (newValue) {
          case 0:
            onTitleChanged?.call("Font Size: 32px");
            break;
        }
      },
      scrollDirection: Axis.vertical,
      children: [
        Text(
          loremIpsum,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: 24,
            package: fontPackage,
          ),
        ),
        Column(
            children: FontWeight.values
                .map(
                  (weight) => Text(
                    weight.toString(),
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 24,
                      fontWeight: weight,
                      fontVariations: [
                        FontVariation(
                            'wght', ((weight.index + 1) * 100).toDouble()),
                      ],
                      package: fontPackage,
                    ),
                  ),
                )
                .toList()),
      ]
          .map((e) => Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: Card(
                  elevation: 2,
                  child: e,
                ),
              ))
          .toList(),
    );
  }
}
