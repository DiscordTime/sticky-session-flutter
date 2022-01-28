import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/create_session/components/grid_color_picker.dart';
import 'package:flutter_sticky_session/login_token/components/decorated_edit_text.dart';

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
        elevation: 1,
        leading: IconButton(
          onPressed: _onBackPressed,
          icon: const Icon(Icons.arrow_back, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: _onSavePressed,
              icon: const Icon(
                Icons.check,
                color: Colors.green,
                size: 30,
              )
            ),
          )
        ],
      ),
      body: Container(
        color: backgroundScreenColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: const [
              SizedBox(height: 50),
              DecoratedEditText(text: "Title"),

              SizedBox(height: 40),
              DecoratedEditText(
                text: "Description",
                maxLines: 3,
                showCounter: true,
              ),

              SizedBox(height: 40,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select a color",
                  style: TextStyle(
                    color: normalColor,
                    fontSize: 21
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GridColorPicker(colors: chooseColorList)

            ],
          ),
        ),
      ),
    );
  }

  _onSavePressed() {
    // TODO: Implement that!
  }

  _onBackPressed() {
    // TODO: Implement that!
  }
}
