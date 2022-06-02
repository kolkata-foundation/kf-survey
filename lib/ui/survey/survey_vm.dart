import 'dart:convert';

import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/models/survey.dart';
import 'package:kf_survey/util/commons.dart';
import 'package:kf_survey/util/firebase_refs.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

class SurveyViewModel extends BaseViewModel {
  final String surveyId;
  final String familyId;
  final String memberId;
  Survey? survey;
  FormGroup form = fb.group({});
  int pageIndex = 0;
  Family? family;

  SurveyViewModel(this.surveyId, this.familyId, this.memberId);

  int get sectionCount => survey?.sections.length ?? 0;

  initialize() async {
    setBusy(true);

    survey =
        Survey.fromJson((await surveyCollection.doc(surveyId).get()).data()!);

    print(JsonEncoder.withIndent('\t').convert(survey));

    form = surveyToFormGroup(survey!);

    print(form?.value);

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

  void submit() {
    print((form.value["general"] as Map)["blood pressure"]);
    print(form.value);
  }
}
