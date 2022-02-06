
class MeetingResponse {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String local;
  final int sessions;
  final int people;

  MeetingResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.local,
    required this.sessions,
    required this.people
  });

  factory MeetingResponse.fromJson(Map<String, dynamic> json) => MeetingResponse(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      local: json["local"],
      sessions: json["sessions"],
      people: json["people"]
  );
}