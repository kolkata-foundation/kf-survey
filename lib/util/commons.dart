import 'package:flutter/material.dart';
import 'package:kf_survey/models/survey.dart';
import 'package:kf_survey/models/survey_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class Pair<T1, T2> {
  final T1 item1;
  final T2 item2;

  Pair(this.item1, this.item2);
}

List<String> localities = ["Sunderban"];
List<String> genders = ["Male", "Female", "Others"];

FormGroup surveyToFormGroup(Survey survey) {
  return fb.group({
    for (var section in survey!.sections)
      section.name: fb.group(
        // TODO: Add filtering based on active
        Map.fromEntries(section.survey_fields
            .where((field) => ![
                  "text_fixed",
                  "image_fixed",
                ].contains(field.type))
            .map((field) => fieldToControl(field))),
      )
  });
}

MapEntry<String, FormControl> fieldToControl(SurveyField field) {
  switch (field.type) {
    case "toogle_input":
    case "checkbox":
      return MapEntry(field.name, fb.control<bool>(false));
    case "text_fixed":
    case "image_fixed":
    case "text_input":
    default:
      return MapEntry(field.name, fb.control<String>(''));
  }
}
