import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.router.dart';
import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/util/firebase_refs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FamilyViewModel extends BaseViewModel {
  final String familyId;
  Family? family;

  FamilyViewModel({required this.familyId});

  final NavigationService _navigationService = locator.get<NavigationService>();

  Future<void> initialise() async {
    setBusy(true);
    var familyDoc = await familyCollection.doc(familyId).get();
    family = Family.fromJson(familyDoc.data()!);
    print(family?.toJson().toString());
    setBusy(false);
  }

  newMemberSurvey(Member member) {
    _navigationService.navigateTo(Routes.surveyListView,
        arguments: SurveyListViewArguments(
          familyId: familyId,
          memberId: member.member_id,
        ));
  }

  newFamilySurvey() {
    _navigationService.navigateTo(Routes.surveyListView,
        arguments: SurveyListViewArguments(familyId: familyId, memberId: "0"));
  }
}
