import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import '../../main.dart';
import 'package:tray_manager/tray_manager.dart';

void initSystemTray() async {
  trayManager.setIcon('assets/onedrive.png');

  final menuItems = <MenuItem>[
    MenuItem(
      key: 'show_window',
      label: 'Show Window',
      onClick: (_) => appWindow?.show(),
    ),
    MenuItem(
      key: 'hide_window',
      label: 'Hide Window',
      onClick: (_) => appWindow?.hide(),
    ),
  ];

  trayManager.setContextMenu(Menu(items: menuItems));
}
