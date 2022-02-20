
import 'package:flutter/material.dart';

class SliverTitle extends StatelessWidget {
  final String text;
  const SliverTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 126, 126, 126),
            fontSize: 20
        ),
      ),
    );
  }
}

