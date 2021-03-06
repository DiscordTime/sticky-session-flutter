
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/sessions/components/session_card.dart';

class UiSessionDetail {
  final String name;
  final String description;
  final int numberOfAnswers;
  final Color highlightColor;

  UiSessionDetail(this.name, this.description, this.numberOfAnswers, this.highlightColor);
}

class SessionListScreen extends StatelessWidget {
  List<UiSessionDetail> sessions = [
    UiSessionDetail(
      "Starfish",
      "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.",
      6,
      const Color.fromARGB(255, 135, 54, 155)
    ),
    UiSessionDetail(
      "Gain & Pleasure",
      "Description Lorem ipsum dolor sit amet, cons ect etur adipiscai elit, sed do eiusmod tempor.",
      5,
      const Color.fromARGB(255, 243, 193, 82)
    ),
  ];

  SessionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (value, index) => _createSessionCard(sessions[index])
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
