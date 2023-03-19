import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'survey_field.g.dart';

@JsonSerializable()
class SurveyField {
  bool active;
  String type;
  String name;

  SurveyField({
    required this.name,
    required this.type,
    required this.active,
  });

  factory SurveyField.fromJson(Map<String, Object?> json) =>
      _$SurveyFieldFromJson(json);
  Map<String, Object?> toJson() => _$SurveyFieldToJson(this);

  Widget toWidget(String controlName) {
    return Container();
  }
}

@JsonSerializable()
class TextFixedSurveyField extends SurveyField {
  final String displayText;
  final int fontSize;

  TextFixedSurveyField({
    required super.name,
    required super.active,
    required this.displayText,
    this.fontSize = 16,
  }) : super(type: "text_fixed");

  factory TextFixedSurveyField.fromJson(Map<String, Object?> json) =>
      _$TextFixedSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$TextFixedSurveyFieldToJson(this);

  @override
  Widget toWidget(String controlName) {
    return Text(
      displayText,
      style: TextStyle(
        fontSize: fontSize.toDouble(),
      ),
    );
  }
}

@JsonSerializable()
class ImageFixedSurveyField extends SurveyField {
  final String source;

  ImageFixedSurveyField({
    required String name,
    required bool active,
    required this.source,
  }) : super(
          active: active,
          type: "image_fixed",
          name: name,
        );

  factory ImageFixedSurveyField.fromJson(Map<String, Object?> json) =>
      _$ImageFixedSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$ImageFixedSurveyFieldToJson(this);
  @override
  Widget toWidget(String controlName) {
    return Center(child: Image.network(source));
  }
}

@JsonSerializable()
class TextInputSurveyField extends SurveyField {
  final String label;
  final int? maxSize;

  TextInputSurveyField({
    required super.name,
    required super.active,
    required this.label,
    this.maxSize,
  }) : super(type: "text_input");

  factory TextInputSurveyField.fromJson(Map<String, Object?> json) =>
      _$TextInputSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$TextInputSurveyFieldToJson(this);
  @override
  Widget toWidget(String controlName) {
    return ReactiveTextField(
      formControlName: controlName,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}

@JsonSerializable()
class ToggleSurveyField extends SurveyField {
  final String label;

  ToggleSurveyField({
    required super.name,
    required super.active,
    required this.label,
  }) : super(type: "toggle_input");

  factory ToggleSurveyField.fromJson(Map<String, Object?> json) =>
      _$ToggleSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$ToggleSurveyFieldToJson(this);
  @override
  Widget toWidget(String controlName) {
    return ReactiveSwitchListTile(
      formControlName: controlName,
      title: Text(label),
    );
  }
}

@JsonSerializable()
class CheckboxSurveyField extends SurveyField {
  final String label;

  CheckboxSurveyField({
    required super.name,
    required super.active,
    required this.label,
  }) : super(type: "checkbox");

  factory CheckboxSurveyField.fromJson(Map<String, Object?> json) =>
      _$CheckboxSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$CheckboxSurveyFieldToJson(this);

  @override
  Widget toWidget(String controlName) {
    return ReactiveCheckboxListTile(
      formControlName: controlName,
      title: Text(label),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
    );
  }
}

@JsonSerializable()
class FiveStarSurveyField extends SurveyField {
  final String label;
  int value = 0;
  FiveStarSurveyField({
    required super.name,
    required super.active,
    required this.label,
  }) : super(type: "fivestar");

  factory FiveStarSurveyField.fromJson(Map<String, Object?> json) =>
      _$FiveStarSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$FiveStarSurveyFieldToJson(this);

  @override
  Widget toWidget(String controlName) {
    return ReactiveCheckboxListTile(
      formControlName: controlName,
      title: Text(label),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
    );
  }
}
