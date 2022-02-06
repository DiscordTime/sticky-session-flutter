
import 'package:flutter/widgets.dart';
import 'package:flutter_sticky_session/env.dart';
import 'package:flutter_sticky_session/ui/main_app.dart';

void main() async {
  String environment = const String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: "",
  );
  print("ENVIRONMENT: $environment");
  initStagingEnv();

  runApp(const MainApp());
}
