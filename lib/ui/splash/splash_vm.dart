import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:kf_survey/firebase_options.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get<NavigationService>();

  initialise() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      PhoneAuthProvider(),
    ]);

    if (FirebaseAuth.instance.currentUser == null) {
      _navigationService.replaceWith(Routes.appLoginView);
    } else {
      _navigationService.replaceWith(Routes.dashboardView);
    }
  }
}
