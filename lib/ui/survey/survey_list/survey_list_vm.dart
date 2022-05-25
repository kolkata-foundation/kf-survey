import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SurveyListViewModel extends BaseViewModel {
  final String familyId;
  final String memberId;
  SurveyListViewModel(this.familyId, this.memberId);

  final _navigationService = locator.get<NavigationService>();

  surveySelected(String surveyId) {
    _navigationService.navigateTo(Routes.surveyView,
        arguments: SurveyViewArguments(
          surveyId: surveyId,
          familyId: familyId,
          memberId: memberId,
        ));
  }
}
