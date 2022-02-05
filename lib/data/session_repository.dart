import 'dart:io';
import 'dart:ui';

import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/remote/remote_data_source.dart';
import 'package:flutter_sticky_session/data/remote/session_response.dart';
import 'package:flutter_sticky_session/data/session.dart';
import 'package:flutter_sticky_session/sessions/session_list_screen.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class SessionRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  SessionRepository(this.remoteDataSource, this.localDataSource);

  Future<List<UiSessionDetail>> getSessions(String meetingId) async {
    List<SessionResponse> remoteData = await remoteDataSource.getSessions(meetingId);
    return remoteData.map((sessionReponse) => Session(
      id: sessionReponse.id,
      meetingId: sessionReponse.meetingId,
      name: sessionReponse.name,
      description: sessionReponse.description,
      highlight: sessionReponse.highlight,
      answer: sessionReponse.answer
    )).map((session) => UiSessionDetail(
      session.name, session.description, session.answer, fromHex(session.highlight)
    )).toList();


    // local
    // List<Session> result = await localDataSource.getSessions();

    // await Future.delayed(const Duration(seconds: 3));
    // return result.map(
    //   (session) => UiSessionDetail(
    //     session.name, session.description, session.answer, fromHex(session.highlight)
    //   )
    // ).toList();
    // await Future.delayed(const Duration(seconds: 3));

    // return List.of({
      // UiSessionDetail(
      //   "Starfish",
      //   "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.",
      //   6,
      //   const Color.fromARGB(255, 135, 54, 155)
      // ),
    //   UiSessionDetail(
    //     "Gain & Pleasure",
    //     "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.",
    //     5,
    //     const Color.fromARGB(255, 243, 193, 82)
    //   ),
    // });
  }
}
