import 'package:firebase_auth/firebase_auth.dart';
import 'package:kf_survey/app/app.locator.dart';
import 'package:kf_survey/app/app.snackbar.dart';
import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/models/survey.dart';
import 'package:kf_survey/util/commons.dart';
import 'package:kf_survey/util/firebase_refs.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SurveyViewModel extends BaseViewModel {
  final String surveyId;
  final String familyId;
  final String memberId;
  Survey? survey;
  FormGroup form = fb.group({});
  int pageIndex = 0;
  Family? family;

  SurveyViewModel(this.surveyId, this.familyId, this.memberId);

  final _snackbarService = locator.get<SnackbarService>();
  final _navigationService = locator.get<NavigationService>();
  int get sectionCount => survey?.sections.length ?? 0;

  initialize() async {
    setBusy(true);

    survey =
        Survey.fromJson((await surveyCollection.doc(surveyId).get()).data()!);
    form = surveyToFormGroup(survey!);
    family =
        Family.fromJson((await familyCollection.doc(familyId).get()).data()!);

    setBusy(false);
  }

  void nextPage() {
    pageIndex += 1;
    notifyListeners();
  }

  void prevPage() {
    pageIndex -= 1;
    notifyListeners();
  }

  Future<void> submit() async {
    setBusy(true);

    try {
      await surveyResultCollection.add({
        "data": form.value,
        'submitted_by': FirebaseAuth.instance.currentUser?.uid,
        'submitted_on': DateTime.now().millisecondsSinceEpoch,
        'family': familyId,
        'member': memberId,
        'survey': surveyId,
      });
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        message: "Survey submitted successfully",
        variant: SnackbarType.success,
      );
      _navigationService.back();
    } catch (e) {
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        message: "Could not add survey. Please try again after some time",
        variant: SnackbarType.error,
      );
    }

    setBusy(false);
  }
}
