// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyField _$SurveyFieldFromJson(Map<String, dynamic> json) => SurveyField(
      name: json['name'] as String,
      type: json['type'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$SurveyFieldToJson(SurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
    };

TextFixedSurveyField _$TextFixedSurveyFieldFromJson(
        Map<String, dynamic> json) =>
    TextFixedSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      displayText: json['displayText'] as String,
      fontSize: json['fontSize'] as int? ?? 16,
    )..type = json['type'] as String;

Map<String, dynamic> _$TextFixedSurveyFieldToJson(
        TextFixedSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'displayText': instance.displayText,
      'fontSize': instance.fontSize,
    };

ImageFixedSurveyField _$ImageFixedSurveyFieldFromJson(
        Map<String, dynamic> json) =>
    ImageFixedSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      source: json['source'] as String,
    )..type = json['type'] as String;

Map<String, dynamic> _$ImageFixedSurveyFieldToJson(
        ImageFixedSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'source': instance.source,
    };

TextInputSurveyField _$TextInputSurveyFieldFromJson(
        Map<String, dynamic> json) =>
    TextInputSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      label: json['label'] as String,
      maxSize: json['maxSize'] as int?,
    )..type = json['type'] as String;

Map<String, dynamic> _$TextInputSurveyFieldToJson(
        TextInputSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'label': instance.label,
      'maxSize': instance.maxSize,
    };

ToggleSurveyField _$ToggleSurveyFieldFromJson(Map<String, dynamic> json) =>
    ToggleSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      label: json['label'] as String,
    )..type = json['type'] as String;

Map<String, dynamic> _$ToggleSurveyFieldToJson(ToggleSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'label': instance.label,
    };

CheckboxSurveyField _$CheckboxSurveyFieldFromJson(Map<String, dynamic> json) =>
    CheckboxSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      label: json['label'] as String,
    )..type = json['type'] as String;

Map<String, dynamic> _$CheckboxSurveyFieldToJson(
        CheckboxSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'label': instance.label,
    };

FiveStarSurveyField _$FiveStarSurveyFieldFromJson(Map<String, dynamic> json) =>
    FiveStarSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      label: json['label'] as String,
    )..type = json['type'] as String;

Map<String, dynamic> _$FiveStarSurveyFieldToJson(
        FiveStarSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'label': instance.label,
    };
