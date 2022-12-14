import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:onedrive_client/common/dialogs/sign_out_dialog.dart';

import '../../providers/auth/auth_providers.dart';
import '../dialogs/about_dialog.dart';
import 'popup_menu_button.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    this.children = const [],
    this.onPreferencesClick,
  });

  final List<PopupItem> children;

  final void Function()? onPreferencesClick;

  @override
  Widget build(BuildContext context) {
    return GtkPopupMenu(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (children.isNotEmpty) ...[
            ...children,
            const Divider(),
          ],
          PopupItem(
            label: 'About',
            onPressed: () => openAboutDialog(context),
          ),
          const Divider(),
          if (onPreferencesClick != null)
            PopupItem(
              label: 'Preferences',
              onPressed: onPreferencesClick!,
            ),
          Consumer(
            builder: (context, ref, child) {
              return AdwButton.flat(
                child: const Text('Sign Out'),
                onPressed: () => showSignOutDialog(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
