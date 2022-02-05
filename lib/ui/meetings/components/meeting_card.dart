
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/ui/meetings/meetings_screen.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class MeetingCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final void Function(UiMeetingDetail meetingDetail)? onPress;
  final int highlight;
  final UiMeetingDetail meetingDetail;

  const MeetingCard({
    Key? key,
    required this.color,
    required this.textColor,
    this.onPress,
    this.highlight = 0,
    required this.meetingDetail
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () { onPress?.call(meetingDetail); },
        child: Column(
          children: [
            Container(
              color: highlight == 0 || highlight >= 100 ? const Color.fromARGB(255, 207, 207, 207) : const Color.fromARGB(255, 253, 75, 70),
              height: 8,
            ),
            Container(
              color: color,
              padding: const EdgeInsets.only(left: 30, top: 18, bottom: 18, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meetingDetail.title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Text(
                    meetingDetail.local,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Text(
                    meetingDetail.description,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Text(
                    "${meetingDetail.sessionNumber} Sessions",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Text(
                    "${meetingDetail.peopleNumber}  Participants",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

