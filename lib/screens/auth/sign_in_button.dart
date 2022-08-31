import 'package:flutter/material.dart';

class MicrosoftSignInButton extends StatelessWidget {
  const MicrosoftSignInButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return SizedBox(
      height: 41,
      width: 212,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/signin_${brightness.name}.png'),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
