import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextImageMaskExample extends StatefulWidget {
  const TextImageMaskExample({super.key});

  @override
  State<TextImageMaskExample> createState() => _TextImageMaskExampleState();
}

class _TextImageMaskExampleState extends State<TextImageMaskExample> {
  Shader? shader;

  @override
  void initState() {
    super.initState();

    rootBundle
        .load('assets/images/ice_cream.png')
        .then((value) => decodeImageFromList(value.buffer.asUint8List()))
        .then((value) => shader = ImageShader(
            value, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage))
        .then((_) => setState(
              () {},
            ));
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (shader == null) {
      child = const CircularProgressIndicator();
    } else {
      child = Text("Hello World",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: 128,
              foreground: Paint()..shader = shader,
              fontWeight: FontWeight.bold));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Image Mask'),
      ),
      body: child,
    );
  }
}
