import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:kf_survey/util/const.dart';
import 'package:stacked_services/stacked_services.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const GoogleProviderConfiguration(clientId: GOOGLE_AUTH_PROVIDER_CLIENT_ID),
  ]);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return MaterialApp(
      title: "kf Survey",
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
