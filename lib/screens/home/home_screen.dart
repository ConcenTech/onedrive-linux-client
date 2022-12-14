import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import 'package:onedrive_client/common/popup_menu.dart/popup_menu.dart';
import 'package:onedrive_client/common/popup_menu.dart/popup_menu_button.dart';
import 'package:onedrive_client/models/onedrive/drive_item.dart';
import '../../common/dialogs/about_dialog.dart';
import '../../providers/auth/auth_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _testOneDrive();
  }

  void _testOneDrive() async {
    // init dio
    final dio = Dio();
    //fetch token
    final token = await ref
        .read(msftAuthenticatorProvider)
        .getSignedInCredentials()
        .then((value) => value?.accessToken);
    if (token == null) {
      print('Empty auth token');
      return;
    }
    // print('token: $token');
    print('fetch drive');
    try {
      final response = await dio.get(
          'https://graph.microsoft.com/v1.0/me/drive/root/children',
          options: Options(headers: {'Authorization': 'bearer $token'}));
      print('response type: ${response.data.runtimeType}');
      final responseData = Map<String, dynamic>.from(response.data);

      print(response.data.toString());

      final driveItems =
          responseData['value'].map((value) => DriveItem.fromMap(value));

      for (var item in driveItems) {
        print(item.id);
      }
    } on DioError catch (e) {
      print('dio error: ${e.message} ${e.response}');
    }
  }

  int _pageIndex = 0;

  void _toSettingsPage() {
    _pageIndex = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AdwScaffold(
        title: Text('OneDrive'),
        body: AdwViewStack(index: _pageIndex, children: [
          HomeWidget(),
          Center(
              child: AdwButton.pill(
            onPressed: () {
              setState(
                () {
                  _pageIndex = 0;
                },
              );
            },
            child: Text('Home'),
          ))
        ]),
        actions: AdwActions().bitsdojo,
        headerBarStyle: const HeaderBarStyle(
          // isTransparent: true,
          // height: 31,
          autoPositionWindowButtons: false,
        ),
        end: [
          PopupMenu(
            onPreferencesClick: _toSettingsPage,
            children: [
              PopupItem(label: 'Another one', onPressed: () {}),
              PopupItem(label: 'DJ Khaled', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Container(
      child: Center(
        child: Text('Welcome Home'),
      ),
    );
  }
}
