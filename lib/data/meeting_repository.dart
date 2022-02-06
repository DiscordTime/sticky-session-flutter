
import 'package:flutter_sticky_session/data/remote/remote_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/remote/response/meeting_response.dart';
import 'package:flutter_sticky_session/data/sample/sample_meeting_data_source.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class MeetingRepository {
  final SampleMeetingDaraSource _localDataSource;
  final RemoteMeetingDataSource _remoteMeetingDataSource;

  MeetingRepository(this._localDataSource, this._remoteMeetingDataSource);

  Stream<List<UiMeetingDetail>> getRecentMeetings() async* {
    yield await _localDataSource.getRecentMeetings();
  }

  Stream<List<UiMeetingDetail>> getOlderMeetings() async* {
    List<MeetingResponse> meetings = await _remoteMeetingDataSource.getMeetings();
    yield meetings.map((meeting) => UiMeetingDetail(
        id: meeting.id,
        title: meeting.title,
        description: meeting.description,
        local: meeting.local,
        startTime: meeting.startDate,
        endTime: meeting.endDate,
        sessionNumber: meeting.sessions,
        peopleNumber: meeting.people
    )).toList();
  }
}
