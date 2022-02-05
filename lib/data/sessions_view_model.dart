import 'dart:async';

import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/sessions/session_list_screen.dart';

class SessionsViewModel {
  final SessionRepository sessionRepository;

  SessionsViewModel(this.sessionRepository);

  Stream<List<UiSessionDetail>> getSessions() async* {
    yield await sessionRepository.getSessions("7d5b5d1c-9dc4-4eb8-b3b8-3fb67cfdac89");
  }
}
