import 'package:flutter/material.dart';
import 'package:kf_survey/ui/survey/survey_list/survey_list_vm.dart';
import 'package:stacked/stacked.dart';

class SurveyListView extends StatelessWidget {
  final String familyId;
  final String memberId;
  const SurveyListView({
    required this.familyId,
    required this.memberId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurveyListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text("Select survey")),
        body: ListView(children: [
          ...model.surveys.entries
              .map(
                (e) => (e.value.active)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(e.value.name),
                          onTap: () => model.surveySelected(e.key),
                          tileColor: Colors.teal.shade100,
                          trailing: const Icon(Icons.arrow_right),
                        ),
                      )
                    : Container(),
              )
              ,
        ]),
      ),
      viewModelBuilder: () => SurveyListViewModel(familyId, memberId),
      onModelReady: (model) => model.initialize(),
    );
  }
}
