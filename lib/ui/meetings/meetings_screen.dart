
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/data/meeting_repository.dart';
import 'package:flutter_sticky_session/data/remote/remote_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/sample/sample_meeting_data_source.dart';
import 'package:flutter_sticky_session/ui/components/data_widget_loader.dart';
import 'package:flutter_sticky_session/ui/meetings/components/meeting_card_list.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({Key? key}) : super(key: key);

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  MeetingRepository meetingRepository = MeetingRepository(
    SampleMeetingDaraSource(),
    RemoteMeetingDataSource()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Meetings",
          style: TextStyle(
              color: primaryColor,
              fontSize: 24
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              // TODO: Implement that!
            },
            icon: const Icon(Icons.menu, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
      ),

      body: Container(
        color: backgroundScreenColor,
        child: DataWidgetLoader(
          dataStream: meetingRepository.getMeetings(),
          onCreateChild: onCreateChild
        ),

      )
    );
  }

  Widget onCreateChild(List<UiMeetingDetail> meetings) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24,),
          MeetingCardList(
            title: "Recents",
            meetings: meetings.where((meeting) => meeting.endTime == "23-01-2022").toList(),
            onPress: _onMeetingCardPressed,
            isMarkedCard: true,
          ),
          MeetingCardList(
            title: "Older",
            meetings: meetings.where((meeting) => meeting.endTime != "23-01-2022").toList(),
            onPress: _onMeetingCardPressed,
            isMarkedCard: false,
          ),
        ],
      ),
    );
  }

  _onMeetingCardPressed(UiMeetingDetail meetingDetail) {
    Navigator.pushNamed(context, "sessions", arguments: meetingDetail);
  }
}
