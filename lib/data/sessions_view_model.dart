import 'dart:async';

import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/ui/sessions/ui_session_detail.dart';

class SessionsViewModel {
  final SessionRepository sessionRepository;

  SessionsViewModel(this.sessionRepository);

  Stream<List<UiSessionDetail>> getSessions(String meetingId) async* {
    yield await sessionRepository.getSessions(meetingId);
  }
}
