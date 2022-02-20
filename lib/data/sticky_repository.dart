
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/sticky.dart';
import 'package:flutter_sticky_session/ui/session/ui_column_detail.dart';

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

  Stream<List<UiColumnDetail>> getStickiesByColumns() async* {
    // await Future.delayed(Duration(seconds: 3));
    List<Sticky> stickies = List.generate(5, (index) => Sticky(id: "01", content: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, seddo eiusmod tempor. Lorem ipsumdolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.", user: "Victor Rattis", sessionId: "s02"));
    yield List.of({
      UiColumnDetail(name: "MORE", color: 0xffc5ffe4, stickies: stickies),
      UiColumnDetail(name: "START", color: 0xffd0e3fd, stickies: List.generate(1, (index) => Sticky(id: "01", content: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, seddo eiusmod tempor. Lorem ipsumdolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.", user: "Victor Rattis", sessionId: "s02"))),
      UiColumnDetail(name: "KEEP", color: 0xffc5ffe4, stickies: List.generate(2, (index) => Sticky(id: "01", content: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, seddo eiusmod tempor. Lorem ipsumdolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.", user: "Victor Rattis", sessionId: "s02"))),
      UiColumnDetail(name: "LESS", color: 0xffffd5c9, stickies: stickies),
      UiColumnDetail(name: "STOP", color: 0xffc5ffe4, stickies: List.generate(3, (index) => Sticky(id: "01", content: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, seddo eiusmod tempor. Lorem ipsumdolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.", user: "Victor Rattis", sessionId: "s02"))),
    });
  }
}
