import 'package:flutter/material.dart';

class TextNeonExample extends StatefulWidget {
  const TextNeonExample({super.key});

  @override
  State<TextNeonExample> createState() => _TextNeonExampleState();
}

class _TextNeonExampleState extends State<TextNeonExample> {
  final _gradientsShaderMapEntryList = [
    [Colors.pink, Colors.blue],
    [Colors.pink, const Color(0xFFFFD700)],
    [Colors.green, Colors.orange],
    [Colors.purple, Colors.cyan],
  ]
      .map((e) => LinearGradient(colors: e, stops: const [0.5, 1.0]))
      .map((e) => MapEntry(
          e, e.createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 60.0))))
      .toList();

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final shader = _gradientsShaderMapEntryList[_selectedIndex].value;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Gradient'),
        ),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
            Stack(
              children: [
                Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = shader
                          ..color = Colors.white
                          ..maskFilter =
                              const MaskFilter.blur(BlurStyle.outer, 10)),
                  ),
                ),
                Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..color = Colors.white
                          ..shader = shader
                          ..maskFilter =
                              const MaskFilter.blur(BlurStyle.solid, 10)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
