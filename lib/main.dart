import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
// import 'package:flutter_config/flutter_config.dart';
import 'package:togumogu/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterConfig.loadEnvVariables();
  await DotEnv.load();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(
            MyApp(),
          ));
}
