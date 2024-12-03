import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.title,
      {super.key, this.enable = true, this.onPressed});
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enable ? onPressed : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.orange,
      disabledColor: Colors.grey,
      height: 45,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
