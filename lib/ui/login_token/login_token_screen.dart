import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/ui/login_token/components/decorated_edit_text.dart';
import 'package:flutter_sticky_session/ui/login_token/components/horizontal_elevated_button.dart';

class LoginWithTokenScreen extends StatelessWidget {
  const LoginWithTokenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Log In with the token",
          style: TextStyle(
            color: primaryColor,
            fontSize: 24
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: _onArrowBackPressed,
          icon: const Icon(Icons.arrow_back, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            const Text(
              "If you do not have a token, ask for meeting admin.",
              style: TextStyle(
                fontSize: 20
              ),
            ),

            const SizedBox(height: 50,),
            const DecoratedEditText(text: "Token"),

            const SizedBox(height: 30,),
            const DecoratedEditText(text: "Username"),

            const SizedBox(height: 50,),
            HorizontalElevatedButton(
              text: "Log In",
              onPress: _onLoginPressed,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _getAppVersion(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: normalColor
                  ),
                ),
              )
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  // TODO: Get the app version correctly
  String _getAppVersion() => "v 01.00.00";

  _onLoginPressed() {
    // TODO: Implement that!
  }

  _onArrowBackPressed() {
    // TODO: Implement that!
  }
}
