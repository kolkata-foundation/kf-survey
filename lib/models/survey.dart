import 'package:json_annotation/json_annotation.dart';
import 'package:kf_survey/models/survey_field.dart';

part 'survey.g.dart';

@JsonSerializable()
class Survey {
  final String name;
  final bool active;
  final List<SurveySection> sections;

  Survey({
    required this.name,
    required this.active,
    required this.sections,
  });
  factory Survey.fromJson(Map<String, Object?> json) => _$SurveyFromJson(json);
  Map<String, Object?> toJson() => _$SurveyToJson(this);
}

@JsonSerializable()
class SurveySection {
  final String name;
  final String label;
  final int index;

  @JsonKey(fromJson: jsonToSurveyFields, toJson: surveyFieldsToJson)
  List<SurveyField> survey_fields;

  SurveySection({
    required this.name,
    required this.label,
    required this.index,
    required this.survey_fields,
  });

  factory SurveySection.fromJson(Map<String, dynamic> json) =>
      _$SurveySectionFromJson(json);
  Map<String, Object?> toJson() => _$SurveySectionToJson(this);
}

List<SurveyField> jsonToSurveyFields(List<dynamic> fields) {
  return fields.map((json) {
    switch (json["type"]) {
      case "text_fixed":
        return TextFixedSurveyField.fromJson(json);
      case "image_fixed":
        return ImageFixedSurveyField.fromJson(json);
      case "text_input":
        return TextInputSurveyField.fromJson(json);
      case "toggle":
        return ToggleSurveyField.fromJson(json);
      case "checkbox":
        return CheckboxSurveyField.fromJson(json);
      case "rating":
        return RatingSurveyField.fromJson(json);
      case "dropdown":
        return DropdownSurveyField.fromJson(json);
      default:
        return SurveyField(
          name: "name",
          type: "type",
          active: false,
        );
    }
  }).toList();
}

List<dynamic> surveyFieldsToJson(List<SurveyField> fields) {
  return fields.map((field) => field.toJson()).toList();
}
