import 'dart:convert';

import 'package:kf_survey/models/survey.dart';
import 'package:kf_survey/models/survey_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  Survey survey = Survey(
    name: "survey_1",
    active: true,
    sections: [
      SurveySection(
        name: "section_1",
        index: 0,
        label: "Section 1",
        survey_fields: [
          TextFixedSurveyField(
              name: "text_fixed_1",
              active: true,
              display_text: "Hello world!!!!"),
          ImageFixedSurveyField(
              name: "image_1",
              active: true,
              source: "https://www.wikipedia.com/img"),
          TextInputSurveyField(
              name: "text_input_1", active: false, label: "text label"),
        ],
      )
    ],
  );
  print(const JsonEncoder.withIndent('\t').convert(survey));

  var form = fb.group({
    for (var section in survey.sections)
      section.name: fb.group({
        for (var field in section.survey_fields) field.name: ['']
      })
  });
  // form.control('0.0.text_fixed_1').value = "Hello";
  print(form.value);
}
