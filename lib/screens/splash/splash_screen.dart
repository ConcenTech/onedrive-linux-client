import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   MdiIcons.microsoftOnedrive,
            //   size: 150,
            // ),
            Image.asset(
              'assets/onedrive.png',
              width: 150,
            ),
            const SizedBox(height: 16),
            const LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
