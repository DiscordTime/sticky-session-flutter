
import 'package:flutter_sticky_session/data/sticky.dart';

class UiColumnDetail {
  final String name;
  final int color;
  final List<Sticky> stickies;

  UiColumnDetail({
    required this.name,
    required this.stickies,
    required this.color,
  });
}
