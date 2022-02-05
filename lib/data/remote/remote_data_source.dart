
import 'dart:convert';

import 'package:flutter_sticky_session/data/remote/session_response.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  Future<List<SessionResponse>> getSessions(String meetingId) async {
    var uri = Uri.https(
      "study-web-app.herokuapp.com", // domain
      "/session", // endpoing
      { // query parameters
        'meetingId': meetingId
      }
    );
    final response = await http.get(uri);

    print(response.body);
    if (response.statusCode == 200) {
      Iterable result = json.decode(response.body);
      return List<SessionResponse>.from(result.map((session) => SessionResponse.fromJson(session)));     
      // return SessionResponse.fromJson(jsonDecode(response.body));
    } else {
      
      return List.empty();
    }
  }
}
