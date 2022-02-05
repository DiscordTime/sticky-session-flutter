
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class SampleMeetingDaraSource {

  UiMeetingDetail meetingDetailSample = UiMeetingDetail(
      title: "Restropective",
      local: "Sala 01 (Cesar Apolo) * 21/03 12:30",
      description: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.",
      startTime: "",
      endTime: "",
      sessionNumber: 3,
      peopleNumber: 8
  );

  UiMeetingDetail meetingDetailSample2 = UiMeetingDetail(
      title: "Restropective",
      local: "Sala 01 (Cesar Apolo) * 21/03 12:30",
      description: "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.",
      startTime: "",
      endTime: "",
      sessionNumber: 2,
      peopleNumber: 8
  );

  Future<List<UiMeetingDetail>> getRecentMeetings() async {
    return List.of([
      meetingDetailSample
    ]);
  }

  Future<List<UiMeetingDetail>> getOlderMeetings() async {
    return List.of([
      meetingDetailSample2,
      meetingDetailSample2,
      meetingDetailSample2,
      meetingDetailSample2
    ]);
  }

}
