
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/ui/meetings/components/meeting_card.dart';
import 'package:flutter_sticky_session/ui/meetings/ui_meeting_detail.dart';

class MeetingCardList extends StatelessWidget {
  final String title;
  final List<UiMeetingDetail> meetings;
  final void Function(UiMeetingDetail meetingDetail)? onPress;
  final bool isMarkedCard;

  const MeetingCardList({
    Key? key,
    required this.title,
    required this.meetings,
    this.onPress,
    this.isMarkedCard = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 126, 126, 126),
                fontSize: 20
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: meetings.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => MeetingCard(
              isMarkedCard: isMarkedCard,
              meetingDetail: meetings[index],
              onPress: onPress,
            )
        ),
      ],
    );
  }
}

