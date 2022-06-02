import 'package:flutter/material.dart';
import 'package:kf_survey/models/family.dart';
import 'package:kf_survey/models/survey.dart';
import 'package:kf_survey/util/commons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

import 'survey_vm.dart';

class SurveyView extends StatelessWidget {
  final String surveyId;
  final String familyId;
  final String memberId;
  const SurveyView({
    required this.surveyId,
    required this.familyId,
    required this.memberId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurveyViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.survey?.name ?? "Loading..."),
        ),
        body: Stack(
          children: [
            ReactiveForm(
              formGroup: model.form,
              child: ListView(
                children: [
                  ...model.survey?.sections
                          .asMap()
                          .map((index, section) => MapEntry(
                              index,
                              (model.pageIndex == index)
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            section.name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Card(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width),
                                              ...section.survey_fields.map(
                                                (surveyField) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: surveyField.toWidget(
                                                      "${section.name}.${surveyField.name}"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container()))
                          .values
                          .toList() ??
                      [],
                  if (model.pageIndex == model.sectionCount)
                    SurveySummaryView(
                        model.family, model.memberId, model.survey, model.form),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (model.pageIndex != 0)
                        ElevatedButton(
                          onPressed: model.prevPage,
                          child: Row(
                            children: const [
                              Icon(Icons.chevron_left),
                              Text("Previous"),
                            ],
                          ),
                        ),
                      if (model.pageIndex != model.sectionCount)
                        ElevatedButton(
                          onPressed: model.nextPage,
                          child: Row(
                            children: const [
                              Text("Next"),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      if (model.pageIndex == model.sectionCount)
                        ElevatedButton(
                          onPressed: model.submit,
                          child: Row(
                            children: const [
                              Text("Submit"),
                              Icon(Icons.check),
                            ],
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
            if (model.isBusy) const LoadingScreen(),
          ],
        ),
      ),
      viewModelBuilder: () => SurveyViewModel(surveyId, familyId, memberId),
      onModelReady: (model) => model.initialize(),
    );
  }
}

class SurveySummaryView extends StatelessWidget {
  final Family? family;
  final String memberId;
  final Survey? survey;
  final FormGroup? form;
  const SurveySummaryView(
    this.family,
    this.memberId,
    this.survey,
    this.form, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Survey ${survey?.name}"),
        Text("Family ${family?.last_name}"),
        if (memberId != "0")
          Text(
            "Member ${family?.members.where((element) => element.member_id == memberId).first.name}",
          ),
        ...survey?.sections.map(
              (section) => Card(
                child: Column(children: [Text(section.name)]),
              ),
            ) ??
            []
      ],
    );
  }
}
