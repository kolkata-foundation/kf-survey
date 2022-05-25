import 'package:firebase_auth/firebase_auth.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get<NavigationService>();

  initialise() async {
    // TODO: Remove this
    await Future.delayed(const Duration(seconds: 2));

    if (FirebaseAuth.instance.currentUser == null) {
      _navigationService.replaceWith(Routes.appLoginView);
    } else {
      _navigationService.replaceWith(Routes.dashboardView);
    }
  }
}
