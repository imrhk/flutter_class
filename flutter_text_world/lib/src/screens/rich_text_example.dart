import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../lorem_ipsum.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text'),
      ),
      body: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: loremIpsum.substring(0, loremIpsum.length ~/ 2),
            ),
            TextSpan(
              text: loremIpsum.substring(
                loremIpsum.length ~/ 2,
                loremIpsum.length,
              ),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const WidgetSpan(
              child: Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(
              children: [
                TextSpan(
                    text: "https://flutter.dev",
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString("https://flutter.dev")),
              ],
            ),
            const WidgetSpan(
              child: Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
          ],
        ),
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
