import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String asset;
  final VoidCallback onPressed;

  const SocialButton({Key? key, required this.asset, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          asset,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
