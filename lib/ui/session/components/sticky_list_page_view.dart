import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/ui/components/horizontal_elevated_button.dart';
import 'package:flutter_sticky_session/ui/session/components/sticky_card_view.dart';
import 'package:flutter_sticky_session/ui/session/ui_column_detail.dart';

class StickyListPageView extends StatelessWidget {
  final UiColumnDetail columnDetail;
  final Function(UiColumnDetail columnDetail)? onPressed;

  const StickyListPageView({
    Key? key,
    required this.columnDetail,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            HorizontalElevatedButton(
              text: "+  NEW NOTE",
              onPress: () => onPressed?.call(columnDetail),
              color: const Color.fromARGB(255, 222, 222, 222),
              textColor: const Color.fromARGB(255, 120, 120, 120),
            ),
            const SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => StickyCardView(
                title: columnDetail.stickies[index].user,
                content: columnDetail.stickies[index].content,
                color: Color(columnDetail.color)
              ),
              itemCount: columnDetail.stickies.length,
              physics: const NeverScrollableScrollPhysics(),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

