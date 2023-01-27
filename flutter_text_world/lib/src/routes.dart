import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/rich_text_example.dart';
import 'screens/selectable_text_example.dart';
import 'screens/text_align_example.dart';
import 'screens/text_font_example.dart';
import 'screens/text_gradient_example.dart';
import 'screens/text_image_mask_example.dart';
import 'screens/text_localization_example.dart';
import 'screens/text_neon_example.dart';
import 'screens/text_overflow_example.dart';
import 'screens/text_rtl_example.dart';
import 'screens/text_style_example.dart';
import 'screens/text_translucent_example.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'text_style',
          builder: (_, __) => const TextStyleExample(),
        ),
        GoRoute(
          path: 'text_font',
          builder: (_, __) => const TextFontExample(),
        ),
        GoRoute(
          path: 'rtl_text',
          builder: (_, __) => const TextRTLExample(),
        ),
        GoRoute(
          path: 'text_overflow',
          builder: (_, __) => const TextOverflowExample(),
        ),
        GoRoute(
          path: 'text_align',
          builder: (_, __) => const TextAlignExample(),
        ),
        GoRoute(
          path: 'text_gradient',
          builder: (_, __) => const TextGradientExample(),
        ),
        GoRoute(
          path: 'text_translucent',
          builder: (_, __) => const TextTranslucentExample(),
        ),
        GoRoute(
          path: 'text_image_mask',
          builder: (_, __) => const TextImageMaskExample(),
        ),
        GoRoute(
          path: 'text_neon',
          builder: (_, __) => const TextNeonExample(),
        ),
        GoRoute(
          path: 'text_l10n',
          builder: (_, __) => const TextLocalizationExample(),
        ),
        GoRoute(
            path: 'selectable_text',
            builder: (_, __) => const SelectableTextExample()),
        GoRoute(
          path: 'rich_text',
          builder: (_, __) => const RichTextExample(),
        ),
      ],
    ),
  ],
);
