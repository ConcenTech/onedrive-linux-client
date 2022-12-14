import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:url_launcher/url_launcher.dart';

void openAboutDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (_) => const _AboutDialog(),
  );
}

class _AboutDialog extends StatefulWidget {
  const _AboutDialog({Key? key}) : super(key: key);

  @override
  State<_AboutDialog> createState() => _AboutDialogState();
}

class _AboutDialogState extends State<_AboutDialog> {
  final _licenseText = <InlineSpan>[];

  @override
  void initState() {
    super.initState();
    _fetchLicenses();
  }

  void _fetchLicenses() async {
    final licenses = await LicenseRegistry.licenses.distinct(((previous, next) {
      return previous.packages.toString() == next.packages.toString() &&
          previous.paragraphs.map((e) => e.text) ==
              next.paragraphs.map((e) => e.text);
    })).toList();

    const newLine = TextSpan(text: '\n');

    for (var license in licenses) {
      _licenseText.addAll([
        TextSpan(
          text: license.packages.join(', '),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        newLine,
        TextSpan(
          text: license.paragraphs.map((e) => e.text).join('\n'),
        ),
        newLine,
        newLine,
      ]);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AdwAboutWindow(
      appIcon: Image.asset('assets/onedrive.png'),
      license: Text.rich(
        TextSpan(text: '', children: _licenseText),
      ),
      copyright: 'Copyright 2022 - ConcenTech Ltd',
      credits: [
        AdwPreferencesGroup.credits(
          children: [
            AdwActionRow(
              title: 'Kevin McDermott-Carpenter',
              onActivated: () {
                launchUrl(
                  Uri.parse('https://github.com/kevmcarp'),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
