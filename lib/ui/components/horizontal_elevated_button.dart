
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/constants.dart';

class HorizontalElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;
  final Color color;
  final Color textColor;

  const HorizontalElevatedButton({
    required this.text,
    required this.onPress,
    required this.color,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPress,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor
                ),
              )
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
            ),
            
          ),
        ),
      ],
    );
  }
}

