
import 'package:flutter/material.dart';

class IconWithTitle extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const IconWithTitle({
    Key? key,
    required this.title,
    required this.color,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(110, color.red, color.green, color.blue),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

