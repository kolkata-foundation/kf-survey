import 'package:kf_survey/ui/auth/login.dart';
import 'package:kf_survey/ui/auth/profile.dart';
import 'package:kf_survey/ui/dashboard/dashboard_v.dart';
import 'package:kf_survey/ui/family/family_add/family_add_v.dart';
import 'package:kf_survey/ui/family/family_v.dart';
import 'package:kf_survey/ui/search/search_v.dart';
import 'package:kf_survey/ui/splash/splash_v.dart';
import 'package:kf_survey/ui/survey/survey_list/survey_list_v.dart';
import 'package:kf_survey/ui/survey/survey_v.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: AppLoginView),
    MaterialRoute(page: AppProfileView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: FamilyView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: SurveyListView),
    MaterialRoute(page: SurveyView),
    MaterialRoute(page: FamilyAddView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: SnackbarService),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
