
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/data/meeting_repository.dart';
import 'package:flutter_sticky_session/data/remote/remote_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/sample/sample_meeting_data_source.dart';
import 'package:flutter_sticky_session/ui/meetings/components/meeting_card.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.menu, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
      ),

      body: Container(
        color: backgroundScreenColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24,),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 12),
                child: Text(
                  "Recents",
                  style: TextStyle(
                    color: Color.fromARGB(255, 126, 126, 126),
                    fontSize: 20
                  ),
                ),
              ),
              StreamBuilder<List<UiMeetingDetail>>(
                  initialData: const [],
                  stream: meetingRepository.getRecentMeetings(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MeetingCard(
                          color: recentMeetingCardColor,
                          textColor: Colors.white,
                          highlight: 20,
                          meetingDetail: snapshot.data![index],
                          onPress: _onMeetingCardPressed,
                        )
                    );
                  }
              ),


              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 12),
                child: Text(
                  "Older",
                  style: TextStyle(
                      color: Color.fromARGB(255, 126, 126, 126),
                      fontSize: 20
                  ),
                ),
              ),
              StreamBuilder<List<UiMeetingDetail>>(
                  initialData: const [],
                  stream: meetingRepository.getOlderMeetings(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MeetingCard(
                          color: Colors.white,
                          textColor: Colors.black,
                          // highlight: 0,
                          meetingDetail: snapshot.data![index],
                          onPress: _onMeetingCardPressed,
                        )
                    );
                  }
              ),
            ],
          ),
        ),
      )
    );
  }

  _onMeetingCardPressed(UiMeetingDetail meetingDetail) {
    Navigator.pushNamed(context, "sessions", arguments: meetingDetail);
  }
}
