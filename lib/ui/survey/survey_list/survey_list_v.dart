import 'package:flutter/material.dart';
import 'package:kf_survey/ui/survey/survey_list/survey_list_vm.dart';
import 'package:stacked/stacked.dart';

class SurveyListView extends StatelessWidget {
  final String familyId;
  final String memberId;
  const SurveyListView({
    required this.familyId,
    required this.memberId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurveyListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text("Select survey")),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select a survey"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("Survey 1"),
              tileColor: Colors.red.shade100,
              onTap: () => {model.surveySelected("0")},
            ),
          ),
        ]),
      ),
      viewModelBuilder: () => SurveyListViewModel(familyId, memberId),
    );
  }
}
