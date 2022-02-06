
class SessionResponse {
  final String id;
  final String meetingId;
  final String name;
  final String description;
  final List<String> columns;
  final String highlight;
  final int answer;

  SessionResponse({
    required this.id,
    required this.meetingId,
    required this.name,
    required this.description,
    required this.columns,
    required this.highlight,
    required this.answer
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) => SessionResponse(
    id: json["id"],
    meetingId: json["meetingId"],
    name: json["name"],
    description: json["description"],
    columns: List.of({}),
    highlight: json["highlight"],
    answer: json["answer"]
  );
}
