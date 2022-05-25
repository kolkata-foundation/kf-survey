import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:kf_survey/ui/splash/splash_v.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:kf_survey/app/app.locator.dart';

class AppProfileView extends StatelessWidget {
  AppProfileView({Key? key}) : super(key: key);
  final _navigationService = locator.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      actions: [
        SignedOutAction(
          (_) => _navigationService.pushNamedAndRemoveUntil(
            Routes.splashView,
            predicate: (route) => false,
          ),
        ),
      ],
    );
  }
}
