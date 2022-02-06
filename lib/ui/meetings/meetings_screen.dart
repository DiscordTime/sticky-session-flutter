
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/data/meeting_repository.dart';
import 'package:flutter_sticky_session/ui/components/data_widget_loader.dart';
import 'package:flutter_sticky_session/ui/meetings/components/meeting_card_list.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';
import 'package:get_it/get_it.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({Key? key}) : super(key: key);

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
          dataStream: GetIt.I<MeetingRepository>().getMeetings(),
          onCreateChild: (List<UiMeetingDetail> meetings) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24,),
                MeetingCardList(
                  title: "Recents",
                  meetings: meetings.where((meeting) => meeting.endTime == "23-01-2022").toList(),
                  onPress: (meetingDetail) => Navigator.pushNamed(context, "sessions", arguments: meetingDetail),
                  isMarkedCard: true,
                ),
                MeetingCardList(
                  title: "Older",
                  meetings: meetings.where((meeting) => meeting.endTime != "23-01-2022").toList(),
                  onPress: (meetingDetail) => Navigator.pushNamed(context, "sessions", arguments: meetingDetail),
                  isMarkedCard: false,
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
