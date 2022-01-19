
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/create_session/components/circle_color_item.dart';
import 'package:flutter_sticky_session/create_session/components/grid_color_picker.dart';
import 'package:flutter_sticky_session/login_token/components/decorated_edit_text.dart';

var colors = [
  Color.fromARGB(255, 135, 54, 155),
  Color.fromARGB(255, 74, 97, 156),
  Color.fromARGB(255, 44, 159, 221),
  Color.fromARGB(255, 240, 102, 68),
  Color.fromARGB(255, 33, 115, 71),
  Color.fromARGB(255, 69, 173, 123),
  Color.fromARGB(255, 225, 134, 127),
  Color.fromARGB(255, 205, 40, 42),
  Color.fromARGB(255, 88, 88, 88),
  Color.fromARGB(255, 121, 133, 190),
  Color.fromARGB(255, 243, 193, 82),
  Color.fromARGB(255, 60, 127, 249),
];


class CreateSessionScreen extends StatelessWidget {
  const CreateSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Session",
          style: TextStyle(
            color: primaryColor,
            fontSize: 24
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const DecoratedEditText(text: "Title"),

            const SizedBox(height: 30),
            const DecoratedEditText(
              text: "Description",
              maxLines: 3,
              showCounter: true,
            ),

            const SizedBox(height: 40,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select a color",
                style: TextStyle(
                  color: normalColor,
                  fontSize: 21
                ),
              ),
            ),
            GridColorPicker(colors: colors)


          ],
        ),
      ),
    );
  }
}
