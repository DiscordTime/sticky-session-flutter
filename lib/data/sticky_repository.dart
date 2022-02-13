
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/sticky.dart';

class StickyRepository {
  final LocalDataSource localDataSource;

  StickyRepository(this.localDataSource);

  void getStickies(String sessionId) async {
    List<Sticky> stickies = List.of({
      Sticky(id: "stk1", content: "Note 1", user: "Victor", sessionId: "3dee2fe9-d3f7-45c3-9018-5b06a56914a1"),
      Sticky(id: "stk2", content: "Note 2", user: "Victor", sessionId: "3dee2fe9-d3f7-45c3-9018-5b06a56914a1"),
      Sticky(id: "stk3", content: "Note 3", user: "Victor", sessionId: "3dee2fe9-d3f7-45c3-9018-5b06a56914a1"),
      Sticky(id: "stk4", content: "Note 4", user: "Hugo", sessionId: "2e5cd180-6713-4f47-a214-eee877c8faf6")
    });
    await localDataSource.insertSticky(stickies);
    localDataSource.getStickies(sessionId);

    // localDataSource.deleteSession(sessionId);
    // localDataSource.getStickies(sessionId);
  }


}
