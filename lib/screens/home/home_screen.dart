import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import '../../providers/auth/auth_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openAboutDialog() async {
    //   showAboutDialog(context: context);
    //   return;

    final licenses = await LicenseRegistry.licenses.distinct(((previous, next) {
      return previous.packages.toString() == next.packages.toString() &&
          previous.paragraphs.map((e) => e.text) ==
              next.paragraphs.map((e) => e.text);
    })).toList();

    var licenceText = <TextSpan>[];

    const newLine = TextSpan(text: '\n');

    for (var license in licenses) {
      licenceText.addAll([
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

    showDialog(
      context: context,
      builder: (_) => AdwAboutWindow(
        appIcon: Image.asset('assets/onedrive.png'),
        license: Text.rich(
          TextSpan(text: '', children: licenceText),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AdwScaffold(
        title: Text('OneDrive'),
        body: AdwViewStack(children: [Container()]),
        actions: AdwActions().bitsdojo,
        headerBarStyle: const HeaderBarStyle(
          // isTransparent: true,
          // height: 31,
          autoPositionWindowButtons: false,
        ),
        end: [
          GtkPopupMenu(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return AdwButton.flat(
                      child: Text('Sign Out'),
                      onPressed: () =>
                          ref.read(authNotifierProvider.notifier).signOut(),
                    );
                  },
                ),
                const Divider(),
                AdwButton.flat(
                  child: Text('Preferences'),
                  onPressed: () {},
                ),
                AdwButton.flat(
                  child: Text('About'),
                  onPressed: _openAboutDialog,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
