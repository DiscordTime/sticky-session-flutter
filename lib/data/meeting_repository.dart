
import 'package:flutter_sticky_session/data/sample/sample_meeting_data_source.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class MeetingRepository {
  final SampleMeetingDaraSource _localDataSource;

  MeetingRepository(this._localDataSource);

  Stream<List<UiMeetingDetail>> getRecentMeetings() async* {
    yield await _localDataSource.getRecentMeetings();
  }

  Stream<List<UiMeetingDetail>> getOlderMeetings() async* {
    yield await _localDataSource.getOlderMeetings();
  }
}
