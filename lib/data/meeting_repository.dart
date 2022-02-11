
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/local/meeting_db_entity.dart';
import 'package:flutter_sticky_session/data/remote/remote_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/remote/response/meeting_response.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class MeetingRepository {
  final LocalDataSource _localDataSource;
  final RemoteMeetingDataSource _remoteMeetingDataSource;
  List<UiMeetingDetail>? _meetings;

  MeetingRepository(this._localDataSource, this._remoteMeetingDataSource);

  Stream<List<UiMeetingDetail>> getMeetings() async* {
    var localMeetings = await _localDataSource.getMeetings();
    if (localMeetings.isNotEmpty) {
      yield localMeetings.map((meeting) => UiMeetingDetail(
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

    List<MeetingResponse> meetings = await _remoteMeetingDataSource.getMeetings();
    yield _meetings ??= meetings.map((meeting) => UiMeetingDetail(
        id: meeting.id,
        title: meeting.title,
        description: meeting.description,
        local: meeting.local,
        startTime: meeting.startDate,
        endTime: meeting.endDate,
        sessionNumber: meeting.sessions,
        peopleNumber: meeting.people
    )).toList();

    _localDataSource.insertMeeting(meetings.map((meeting) => MeetingDbEntity(
        id: meeting.id,
        title: meeting.title,
        description: meeting.description,
        startDate: meeting.startDate,
        endDate: meeting.endDate,
        local: meeting.local,
        sessions: meeting.sessions,
        people: meeting.people
    )).toList());
  }
}
