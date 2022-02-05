import 'dart:async';

import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/ui/sessions/session_list_screen.dart';

class SessionsViewModel {
  final SessionRepository sessionRepository;

  SessionsViewModel(this.sessionRepository);

  Stream<List<UiSessionDetail>> getSessions() async* {
    yield await sessionRepository.getSessions("285ed03f-6665-4e4c-a7fc-849abd3e0b95");
  }
}
