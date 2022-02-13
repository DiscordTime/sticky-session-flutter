
import 'dart:ui';

class UiSessionDetail {
  final String id;
  final String name;
  final String description;
  final int numberOfAnswers;
  final Color highlightColor;

  UiSessionDetail(
      this.id,
      this.name,
      this.description,
      this.numberOfAnswers,
      this.highlightColor
  );
}