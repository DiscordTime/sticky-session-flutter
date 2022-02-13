
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/remote/remote_session_data_source.dart';
import 'package:flutter_sticky_session/data/remote/response/session_response.dart';
import 'package:flutter_sticky_session/data/session.dart';
import 'package:flutter_sticky_session/ui/sessions/ui_session_detail.dart';
import 'package:flutter_sticky_session/utils/color_utils.dart';

class SessionRepository {
  final RemoteSessionDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  SessionRepository(this.remoteDataSource, this.localDataSource);

  Stream<List<UiSessionDetail>> getSessions(String meetingId) async* {
    var result = (await localDataSource.getSessions(meetingId)).map((session) => UiSessionDetail(
        session.id, session.name, session.description, session.answer, fromHex(session.highlight)
    )).toList();
    if (result.isNotEmpty) yield result;

    List<SessionResponse> remoteData = await remoteDataSource.getSessions(meetingId);
    List<Session> sessions = remoteData.map((sessionResponse) => Session(
      id: sessionResponse.id,
      meetingId: sessionResponse.meetingId,
      name: sessionResponse.name,
      description: sessionResponse.description,
      highlight: sessionResponse.highlight,
      answer: sessionResponse.answer
    )).toList();
    yield sessions.map((session) => UiSessionDetail(
        session.id, session.name, session.description, session.answer, fromHex(session.highlight)
    )).toList();

    await localDataSource.insertSession(sessions);
  }
}
