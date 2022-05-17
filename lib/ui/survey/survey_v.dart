import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'survey_vm.dart';

class SurveyView extends StatelessWidget {
  const SurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SurveyViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Survey"),
        ),
      ),
      viewModelBuilder: () => SurveyViewModel(),
    );
  }
}
