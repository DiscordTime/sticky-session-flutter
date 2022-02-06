
import 'dart:convert';
import 'package:flutter_sticky_session/data/remote/response/meeting_response.dart';
import 'package:flutter_sticky_session/env.dart';
import 'package:http/http.dart' as http;

class RemoteMeetingDataSource {
  Future<List<MeetingResponse>> getMeetings() async {
    Uri uri = Uri.https(
        env.domainUrl,
        "/meeting"
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return List<MeetingResponse>.from(
          json.decode(response.body)
              .map((meeting) => MeetingResponse.fromJson(meeting))
      );
    }

    return List.empty();
  }
}
