import 'package:flutter/material.dart';
import 'package:flutter_sticky_session/ui/create_session/create_session_screen.dart';
import 'package:flutter_sticky_session/ui/login_token/login_token_screen.dart';
import 'package:flutter_sticky_session/ui/meetings/meetings_screen.dart';
import 'package:flutter_sticky_session/ui/sessions/session_list_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "login-token": (context) => const LoginWithTokenScreen(),
        "create-session": (context) => const CreateSessionScreen(),
        "sessions": (context) => SessionListScreen(),

        "home": (context) => MeetingsScreen(),

      },
      initialRoute: "home",
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Bar Title")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("login-token");
              },
              child: const Text("Login with Token Screen")
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("create-session");
              },
              child: const Text("Create Session Screen")
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("sessions");
              },
              child: const Text("Session List Screen")
            ),
          ],
        ),
      ),
    );
  }
}
