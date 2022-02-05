
import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/constants.dart';

class SessionCard extends StatelessWidget {
  final String title;
  final String description;
  final int answerNumber;
  final Color highlightColor;
  final void Function()? onPressed;

  const SessionCard({
    required this.title,
    required this.description,
    required this.highlightColor,
    this.answerNumber = 0,
    this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: highlightColor,
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    ),
                  ),
      
                  const SizedBox(height: 10,),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  
                  const SizedBox(height: 10,),
                  Text(
                    "$answerNumber Responses",
                    style: const TextStyle(
                      fontSize: 16,
                      color: primaryColor
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
