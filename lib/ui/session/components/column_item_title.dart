
import 'package:flutter/material.dart';

class ColumnItemTitle extends StatelessWidget {
  final String text;

  const ColumnItemTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 135, 135, 135)
              ),
            )
        )
      ],
    );
  }
}

