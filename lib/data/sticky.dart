
class Sticky {
  final String id;
  final String content;
  final String user;
  final String sessionId;

  Sticky({
    required this.id,
    required this.content,
    required this.user,
    required this.sessionId
  });

  static Sticky toSticky(Map<String, dynamic> map) => Sticky(
      id: map['id'],
      content:map['content'],
      user: map['user'],
      sessionId: map['session_id']
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'content': content,
    'user': user,
    'session_id': sessionId
  };
}
