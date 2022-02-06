
import 'dart:convert';
import 'package:flutter_sticky_session/data/remote/response/session_response.dart';
import 'package:flutter_sticky_session/env.dart';
import 'package:http/http.dart' as http;

class RemoteSessionDataSource {
  Future<List<SessionResponse>> getSessions(String meetingId) async {
    var uri = Uri.https(
      env.domainUrl, // domain
      "/session", // endpoing
      { // query parameters
        'meetingId': meetingId
      }
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return List<SessionResponse>.from(
          json.decode(response.body)
              .map((session) => SessionResponse.fromJson(session))
      );
    } else {
      return List.empty();
    }
  }
}
