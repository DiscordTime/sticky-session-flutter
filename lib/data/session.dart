
class Session {
  final String id;
  final String meetingId;
  final String name;
  final String description;
  final String highlight;
  final int answer;

  Session({
    required this.id, 
    required this.meetingId,
    required this.name,
    required this.description,
    required this.highlight,
    required this.answer
  });

  static Session toCreate(Map<String, dynamic> map) => Session(
      id: map['id'],
      meetingId: map['meetingId'],
      name: map['name'],
      description: map['description'],
      highlight: map['highlight'],
      answer: map['answer']
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'meetingId': meetingId,
    'name': name,
    'description': description,
    'highlight': highlight,
    'answer': answer
  };
}
