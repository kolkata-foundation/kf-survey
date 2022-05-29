import 'dart:convert';

import 'package:kf_survey/models/survey.dart';
import 'package:kf_survey/models/survey_field.dart';

void main() {
  Survey survey = Survey(name: "survey 1", active: true, sections: [
    SurveySection(name: "section 1", index: 0, survey_fields: [
      TextFixedSurveyField(
          name: "text_fixed_1", active: true, display_text: "Hello world!!!!"),
      ImageFixedSurveyField(
          name: "image_1",
          active: true,
          source: "https://www.wikipedia.com/img"),
      TextInputSurveyField(
          name: "text_input_1", active: false, label: "text label"),
    ])
  ]);
  var jsonStr = JsonEncoder.withIndent('\t').convert(survey);
  print(jsonStr);
  print(Survey.fromJson(jsonDecode(jsonStr)));
}
