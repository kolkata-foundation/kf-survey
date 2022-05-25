import 'package:flutter/material.dart';
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
          title: Text("Survey"),
        ),
        body: ListView(children: []),
      ),
      viewModelBuilder: () => SurveyViewModel(surveyId, familyId, memberId),
    );
  }
}
