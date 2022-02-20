
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/ui/session/components/sticky_card.dart';

class StickyCardView extends StatelessWidget {
  final String content;
  final String title;
  final Color color;

  const StickyCardView({
    Key? key,
    required this.content,
    required this.title,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: StickyCard(
        color: color,
        child: Container(
          padding: const EdgeInsets.only(right: 23, left: 23, top: 23, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                )
              ),
              const SizedBox(height: 20,),
              Text(
                content,
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

