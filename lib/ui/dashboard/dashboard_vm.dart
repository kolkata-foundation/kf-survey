import 'package:kf_survey/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator.get<NavigationService>();
  void onProfileTap() {
    _navigationService.navigateTo(Routes.profileScreen);
  }

  void onAddFamilyTap() {
    _navigationService.navigateTo(Routes.familyAddView);
  }

  void onFindFamilyTap() {}

  void onFindPersonTap() {}
}
