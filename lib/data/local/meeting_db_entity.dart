
class MeetingDbEntity {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String local;
  final int sessions;
  final int people;

  MeetingDbEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.local,
    required this.sessions,
    required this.people
  });

  static MeetingDbEntity toCreate(Map<String, dynamic> map) => MeetingDbEntity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      local: map['local'],
      sessions: map['sessions'],
      people: map['people']
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'startDate': startDate,
    'endDate': endDate,
    'local': local,
    'sessions': sessions,
    'people': people
  };
}
