import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

void showSignOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const SignOutDialog(),
  );
}

class SignOutDialog extends ConsumerWidget {
  const SignOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GtkDialog(
      title: Text('Sign Out'),
      children: [
        Text('Are you sure?'),
      ],
    );
  }
}

// ref.read(authNotifierProvider.notifier).signOut()
