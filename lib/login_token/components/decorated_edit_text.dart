import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/constants.dart';

class DecoratedEditText extends StatefulWidget {
  final String text;

  const DecoratedEditText({
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  State<DecoratedEditText> createState() => _DecoratedEditTextState();
}

class _DecoratedEditTextState extends State<DecoratedEditText> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          _focused = value;
        });
      },
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: normalColor,
              width: 2.5
            )
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 2.5
            )
          ),
          labelText: widget.text,
          labelStyle: TextStyle(
            color: _focused ? primaryColor : normalColor,
            fontSize: 18
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20)
        ),
        style: const TextStyle(
          fontSize: 18
        ),
      ),
    );
  }
}
