import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text World'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Text Style'),
            onTap: () => context.go('/text_style'),
          ),
          ListTile(
            title: const Text('Text Font'),
            onTap: () => context.go('/text_font'),
          ),
          ListTile(
            title: const Text(
              'Right-to-Left',
            ),
            onTap: () => context.go('/rtl_text'),
          ),
          ListTile(
            title: const Text(
              'Text Overflow',
            ),
            onTap: () => context.go('/text_overflow'),
          ),
          ListTile(
            title: const Text(
              'Text Align',
            ),
            onTap: () => context.go('/text_align'),
          ),
          ListTile(
            title: const Text(
              'Text Gradient',
            ),
            onTap: () => context.go('/text_gradient'),
          ),
          ListTile(
            title: const Text(
              'Text Translucent',
            ),
            onTap: () => context.go('/text_translucent'),
          ),
          ListTile(
            title: const Text(
              'Text Image Mask',
            ),
            onTap: () => context.go('/text_image_mask'),
          ),
          ListTile(
            title: const Text(
              'Text Neon',
            ),
            onTap: () => context.go('/text_neon'),
          ),
          ListTile(
            title: const Text(
              'Translated Text',
            ),
            onTap: () => context.go('/text_l10n'),
          ),
          ListTile(
            title: const Text(
              'Selectable Text',
            ),
            onTap: () => context.go('/selectable_text'),
          ),
          ListTile(
            title: const Text(
              'Rich Text',
            ),
            onTap: () => context.go('/rich_text'),
          ),
        ],
      ),
    );
  }
}
