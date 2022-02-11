
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/ui/meetings/components/icon_with_title.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

const normalCardLine = Color.fromARGB(255, 207, 207, 207);

class MeetingCard extends StatelessWidget {
  final void Function(UiMeetingDetail meetingDetail)? onPress;
  final UiMeetingDetail meetingDetail;
  final bool isMarkedCard;

  const MeetingCard({
    Key? key,
    required this.isMarkedCard,
    this.onPress,
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
              color: isMarkedCard ? primaryColor : normalCardLine,
              height: 8,
            ),
            Container(
              color: isMarkedCard ? recentMeetingCardColor : Colors.white,
              padding: const EdgeInsets.only(left: 30, top: 18, bottom: 18, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meetingDetail.title,
                    style: TextStyle(
                      color: isMarkedCard ? Colors.white : Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Text(
                    meetingDetail.local,
                    style: TextStyle(
                      color: isMarkedCard ? Colors.white : Colors.black,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Text(
                    meetingDetail.description,
                    style: TextStyle(
                      color: getDescriptionColor(isMarkedCard),
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15,),
                  IconWithTitle(
                      title: "${meetingDetail.sessionNumber} Sessions",
                      color: isMarkedCard ? Colors.white : primaryColor,
                      icon: Icons.article_sharp
                  ),


                  const SizedBox(height: 10,),
                  IconWithTitle(
                      title: "${meetingDetail.peopleNumber} Participants",
                      color: isMarkedCard ? Colors.white : primaryColor,
                      icon: Icons.people
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Color getDescriptionColor(bool isMarkedCard) {
    Color color = isMarkedCard ? Colors.white : Colors.black;
    return Color.fromARGB(180, color.red, color.green, color.blue);
  }

}

