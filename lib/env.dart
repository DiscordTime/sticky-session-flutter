
import 'package:flutter/widgets.dart';

enum BuildFlavor { production, development, staging }

BuildEnvironment get env => _env!;
BuildEnvironment? _env;

class BuildEnvironment {
  final BuildFlavor flavor;
  final String domainUrl;

  BuildEnvironment._init({required this.flavor, required this.domainUrl});

  static void init({@required flavor, @required domainUrl}) =>
      _env ??= BuildEnvironment._init(flavor: flavor, domainUrl: domainUrl);
}

void initStagingEnv() {
  BuildEnvironment.init(
      flavor: BuildFlavor.staging,
      domainUrl: "study-web-app.herokuapp.com"
  );
}