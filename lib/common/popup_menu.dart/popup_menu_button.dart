import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class PopupItem extends StatelessWidget {
  const PopupItem({
    super.key,
    required this.label,
    required this.onPressed,
    this.popOnPressed = true,
  });

  final String label;

  final void Function() onPressed;

  /// Calls `Navigator.of(context).pop()` to close
  /// the GtkPopupMenu
  final bool popOnPressed;

  @override
  Widget build(BuildContext context) {
    return AdwButton.flat(
      child: Text(label),
      onPressed: () {
        if (popOnPressed) {
          Navigator.of(context).pop();
        }
        onPressed();
      },
    );
  }
}
