
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/remote/remote_session_data_source.dart';
import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/data/sessions_view_model.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';
import 'package:flutter_sticky_session/ui/sessions/components/session_card.dart';
import 'package:flutter_sticky_session/ui/sessions/ui_session_detail.dart';

class SessionListScreen extends StatefulWidget {
  const SessionListScreen({Key? key}) : super(key: key);

  @override
  State<SessionListScreen> createState() => _SessionListScreenState();
}

class _SessionListScreenState extends State<SessionListScreen> {
  SessionsViewModel sessionsViewModel = SessionsViewModel(
    SessionRepository(RemoteSessionDataSource(), LocalDataSource())
  );
  List<UiSessionDetail> sessions = List.of({});

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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      
      body: Container(
        color: backgroundScreenColor,
        child: StreamBuilder<List<UiSessionDetail>>(
          stream: sessionsViewModel.getSessions(meetingDetail.id),
          initialData: List.empty(),
          builder: (context, snapshot) {
            print("ListView.builder");
            return snapshot.data?.isEmpty ?? true ?
              const Text("Empty") :
              ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => _createSessionCard(snapshot.data![index])
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

  _createSessionCard(UiSessionDetail session) => SessionCard(
    title: session.name,
    description: session.description,
    highlightColor: session.highlightColor,
    answerNumber: session.numberOfAnswers,
    onPressed: () { _onSessionCardPressed(session); },
  );

  _onCreateSessionPressed() {
    // TODO: Implement that!
  }

  _onSessionCardPressed(UiSessionDetail session) {
    // TODO: Implement that!
  }
}
