import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/constants.dart';

class DecoratedEditText extends StatefulWidget {
  final String text;
  final int maxLines;
  final bool showCounter;
  final int maxCaracteres;

  const DecoratedEditText({
    required this.text,
    this.maxLines = 1,
    this.maxCaracteres = 30,
    this.showCounter = false,
    Key? key
  }) : super(key: key);

  @override
  State<DecoratedEditText> createState() => _DecoratedEditTextState();
}

class _DecoratedEditTextState extends State<DecoratedEditText> {
  bool _focused = false;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          _focused = value;
        });
      },
      child: TextField(
        maxLines: widget.maxLines,
        controller: _textEditingController,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          counterText: _getCounterText(),
          counterStyle: const TextStyle(
            fontSize: 14
          ),
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

  _getCounterText() => widget.showCounter ?
    "${_textEditingController.text.length}/${widget.maxCaracteres}" : "";
}
