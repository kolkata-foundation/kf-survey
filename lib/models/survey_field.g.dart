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
      display_text: json['display_text'] as String,
      font_size: json['font_size'] as int? ?? 16,
    )..type = json['type'] as String;

Map<String, dynamic> _$TextFixedSurveyFieldToJson(
        TextFixedSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'display_text': instance.display_text,
      'font_size': instance.font_size,
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
      max_size: json['max_size'] as int?,
    )..type = json['type'] as String;

Map<String, dynamic> _$TextInputSurveyFieldToJson(
        TextInputSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'label': instance.label,
      'max_size': instance.max_size,
    };

ToggleInputSurveyField _$ToggleInputSurveyFieldFromJson(
        Map<String, dynamic> json) =>
    ToggleInputSurveyField(
      name: json['name'] as String,
      active: json['active'] as bool,
      label: json['label'] as String,
    )..type = json['type'] as String;

Map<String, dynamic> _$ToggleInputSurveyFieldToJson(
        ToggleInputSurveyField instance) =>
    <String, dynamic>{
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'label': instance.label,
    };
