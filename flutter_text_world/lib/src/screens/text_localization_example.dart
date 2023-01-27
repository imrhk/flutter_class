import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextLocalizationExample extends StatelessWidget {
  const TextLocalizationExample({super.key});

  @override
  Widget build(BuildContext context) {
    const delegates = [AppLocalizations.delegate];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Translated Text'),
      ),
      body: Column(
        children: [
          for (var i in [
            const Locale("en", "US"),
            const Locale("fr", "FR"),
            const Locale("ar", "AR")
          ])
            Localizations.override(
              context: context,
              locale: i,
              delegates: delegates,
              child: Builder(builder: (context) {
                return ListTile(
                  title: Text(AppLocalizations.of(context).hello_world),
                  subtitle: Text(i.languageCode),
                );
              }),
            ),
        ],
      ),
    );
  }
}
