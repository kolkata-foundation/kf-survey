import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:kf_survey/firebase_options.dart';
import 'package:kf_survey/util/const.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get<NavigationService>();

  initialise() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterFireUIAuth.configureProviders([
      const EmailProviderConfiguration(),
      const PhoneProviderConfiguration(),
      const GoogleProviderConfiguration(
          clientId: GOOGLE_AUTH_PROVIDER_CLIENT_ID),
    ]);

    if (FirebaseAuth.instance.currentUser == null) {
      _navigationService.replaceWith(Routes.appLoginView);
    } else {
      _navigationService.replaceWith(Routes.dashboardView);
    }
  }
}
