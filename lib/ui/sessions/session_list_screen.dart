
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/data/sticky_repository.dart';
import 'package:flutter_sticky_session/ui/components/data_widget_loader.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';
import 'package:flutter_sticky_session/ui/sessions/components/session_card.dart';
import 'package:flutter_sticky_session/ui/sessions/ui_session_detail.dart';
import 'package:get_it/get_it.dart';

class SessionListScreen extends StatelessWidget {
  const SessionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UiMeetingDetail meetingDetail = ModalRoute.of(context)!.settings.arguments as UiMeetingDetail;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Retrospective",
          style: TextStyle(
            color: primaryColor,
            fontSize: 24
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      
      body: Container(
        color: backgroundScreenColor,
        child: DataWidgetLoader<List<UiSessionDetail>>(
          dataStream: GetIt.I<SessionRepository>().getSessions(meetingDetail.id),
          onCreateChild: (sessions) {
            return sessions.isEmpty ?
              const Text("Empty") :
              ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) => _createSessionCard(context, sessions[index])
              );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onCreateSessionPressed(),
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30
        ),
      ),
    );
  }

  _createSessionCard(BuildContext context, UiSessionDetail session) => SessionCard(
    title: session.name,
    description: session.description,
    highlightColor: session.highlightColor,
    answerNumber: session.numberOfAnswers,
    onPressed: () {
      Navigator.of(context).pushNamed("session", arguments: session);
    },
  );

  _onCreateSessionPressed() {
    // TODO: Implement that!
  }


}
