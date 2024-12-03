import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const InputWidget(this.hint,
      {super.key, this.obscureText = false, this.keyboardType, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input(),
        const Divider(
          color: Colors.white,
          height: 1,
          thickness: 0.5,
        )
      ],
    );
  }

  _input() {
    return TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        autofocus: !obscureText,
        cursorColor: Colors.white,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            hintStyle: const TextStyle(fontSize: 17, color: Colors.white)));
  }
}
