import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class AppLoginView extends StatelessWidget {
  AppLoginView({Key? key}) : super(key: key);
  final _navigationService = locator.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, _) => _navigationService.replaceWith(Routes.dashboardView),
        )
      ],
    );
  }
}
