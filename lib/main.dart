
import 'package:flutter/widgets.dart';
import 'package:flutter_sticky_session/data/local/local_data_source.dart';
import 'package:flutter_sticky_session/data/meeting_repository.dart';
import 'package:flutter_sticky_session/data/remote/remote_meeting_data_source.dart';
import 'package:flutter_sticky_session/data/remote/remote_session_data_source.dart';
import 'package:flutter_sticky_session/data/session_repository.dart';
import 'package:flutter_sticky_session/data/sticky_repository.dart';
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

  GetIt.instance.registerSingleton<LocalDataSource>(
      LocalDataSource()
  );

  GetIt.instance.registerSingleton<MeetingRepository>(
      MeetingRepository(
          GetIt.I<LocalDataSource>(),
          RemoteMeetingDataSource()
      )
  );
  GetIt.instance.registerSingleton<SessionRepository>(
      SessionRepository(
          RemoteSessionDataSource(),
          GetIt.I<LocalDataSource>()
      )
  );
  GetIt.instance.registerSingleton<StickyRepository>(
      StickyRepository(
          GetIt.I<LocalDataSource>()
      )
  );

  runApp(const MainApp());
}
