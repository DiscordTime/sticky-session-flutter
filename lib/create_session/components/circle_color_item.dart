
import 'package:flutter/material.dart';

class CircleColotItem extends StatefulWidget {
  final Color color;
  final bool isChecked;

  const CircleColotItem({
    required this.color,
    required this.isChecked,
    Key? key
  }) : super(key: key);

  @override
  State<CircleColotItem> createState() => _CircleColotItemState();
}

class _CircleColotItemState extends State<CircleColotItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle
      ),
      child: widget.isChecked ? _getCheckerCicle() : null,
    );
  }

  Widget _getCheckerCicle() => Container(
    margin: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.black54,
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.check,
      color: Colors.white,
      size: 40,
    ),
  );
}