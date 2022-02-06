
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

  Future<List<UiSessionDetail>> getSessions(String meetingId) async {
    List<SessionResponse> remoteData = await remoteDataSource.getSessions(meetingId);
    return remoteData.map((sessionResponse) => Session(
      id: sessionResponse.id,
      meetingId: sessionResponse.meetingId,
      name: sessionResponse.name,
      description: sessionResponse.description,
      highlight: sessionResponse.highlight,
      answer: sessionResponse.answer
    )).map((session) => UiSessionDetail(
      session.name, session.description, session.answer, fromHex(session.highlight)
    )).toList();
  }
}
