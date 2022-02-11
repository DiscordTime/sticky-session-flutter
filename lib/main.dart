
import 'package:flutter/widgets.dart';
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/meeting_repository.dart';
import 'package:flutter_sticky_session/data/remote/remote_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/remote/remote_session_data_source.dart';
import 'package:flutter_sticky_session/data/sample/sample_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/data/sessions_view_model.dart';
import 'package:flutter_sticky_session/env.dart';
import 'package:flutter_sticky_session/ui/main_app.dart';

import 'package:get_it/get_it.dart';


void main() async {
  String environment = const String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: "",
  );
  print("ENVIRONMENT: $environment");
  initStagingEnv();

  GetIt.instance.registerSingleton<MeetingRepository>(
      MeetingRepository(
          LocalDataSource(),
          RemoteMeetingDataSource()
      )
  );
  GetIt.instance.registerSingleton<SessionsViewModel>(
      SessionsViewModel(SessionRepository(RemoteSessionDataSource(), LocalDataSource()))
  );

  runApp(const MainApp());
}
