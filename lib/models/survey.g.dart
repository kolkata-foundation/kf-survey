// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey _$SurveyFromJson(Map<String, dynamic> json) => Survey(
      name: json['name'] as String,
      active: json['active'] as bool,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SurveySection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'sections': instance.sections,
    };

SurveySection _$SurveySectionFromJson(Map<String, dynamic> json) =>
    SurveySection(
      name: json['name'] as String,
      index: json['index'] as int,
      survey_fields: jsonToSurveyFields(json['survey_fields'] as List),
    );

Map<String, dynamic> _$SurveySectionToJson(SurveySection instance) =>
    <String, dynamic>{
      'name': instance.name,
      'index': instance.index,
      'survey_fields': surveyFieldsToJson(instance.survey_fields),
    };
