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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurveyViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.survey?.name ?? "Loading..."),
        ),
        body: (model.isBusy)
            ? const LoadingScreen(
                opacity: 1.0,
              )
            : ReactiveForm(
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
                                              section.label,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.teal,
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width),
                                                ...section.survey_fields.map(
                                                  (surveyField) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                      SurveySummaryView(model.family, model.memberId,
                          model.survey, model.form),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (model.pageIndex != 0)
                          ElevatedButton(
                            onPressed: model.prevPage,
                            child: const Row(
                              children: [
                                Icon(Icons.chevron_left),
                                Text("Previous"),
                              ],
                            ),
                          ),
                        if (model.pageIndex != model.sectionCount)
                          ElevatedButton(
                            onPressed: model.nextPage,
                            child: const Row(
                              children: [
                                Text("Next"),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        if (model.pageIndex == model.sectionCount)
                          ElevatedButton(
                            onPressed: model.submit,
                            child: const Row(
                              children: [
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(7),
              },
              children: [
                TableRow(children: [
                  const TableCell(child: Text("Survey")),
                  TableCell(child: Text(survey?.name ?? "")),
                ]),
                TableRow(children: [
                  const TableCell(child: Text("Family")),
                  TableCell(child: Text(family?.last_name ?? "")),
                ]),
                if (memberId != "0")
                  TableRow(children: [
                    const TableCell(child: Text("Member")),
                    TableCell(
                        child: Text(family?.members
                                .where(
                                    (element) => element.member_id == memberId)
                                .first
                                .name ??
                            "")),
                  ]),
              ],
            ),
          ),
        ),
        ...survey?.sections.map(
              (section) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      Text(section.label),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(7),
                        },
                        children: [
                          ...section.survey_fields
                              .where((field) => !["text_fixed", "image_fixed"]
                                  .contains(field.type))
                              .map(
                                (field) => TableRow(
                                  children: [
                                    TableCell(child: Text(field.name)),
                                    TableCell(
                                      child: Text((form?.value[section.name]
                                              as Map)[field.name]
                                          .toString()),
                                    )
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ) ??
            []
      ],
    );
  }
}
