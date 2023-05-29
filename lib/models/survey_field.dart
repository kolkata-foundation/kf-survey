import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_flutter_rating_bar/reactive_flutter_rating_bar.dart';
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
  final String display_text;
  final int font_size;

  TextFixedSurveyField({
    required String name,
    required bool active,
    required this.display_text,
    this.font_size = 16,
  }) : super(
          active: active,
          type: "text_fixed",
          name: name,
        );

  factory TextFixedSurveyField.fromJson(Map<String, Object?> json) =>
      _$TextFixedSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$TextFixedSurveyFieldToJson(this);

  @override
  Widget toWidget(String controlName) {
    return Text(
      display_text,
      style: TextStyle(
        fontSize: font_size.toDouble(),
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
  final int? max_size;

  TextInputSurveyField({
    required String name,
    required bool active,
    required this.label,
    this.max_size,
  }) : super(
          active: active,
          type: "text_input",
          name: name,
        );

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
    required String name,
    required bool active,
    required this.label,
  }) : super(
          active: active,
          type: "toggle_input",
          name: name,
        );

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
    required String name,
    required bool active,
    required this.label,
  }) : super(
          active: active,
          type: "checkbox",
          name: name,
        );

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
class RatingSurveyField extends SurveyField {
  final String label;

  RatingSurveyField({
    required String name,
    required bool active,
    required this.label,
  }) : super(
          active: active,
          type: "rating",
          name: name,
        );

  factory RatingSurveyField.fromJson(Map<String, Object?> json) =>
      _$RatingSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$RatingSurveyFieldToJson(this);

  @override
  Widget toWidget(String controlName) {
    return ReactiveRatingBar<double>(
      formControlName: controlName,
      decoration: InputDecoration(
        label: Text(label),
        border: InputBorder.none,
      ),
      ratingWidget: RatingWidget(
          empty: const Icon(Icons.star_border, color: Colors.yellow),
          half: const Icon(Icons.star_half, color: Colors.yellow),
          full: const Icon(Icons.star, color: Colors.yellow)),
    );
  }
}

@JsonSerializable()
class DropdownSurveyField extends SurveyField {
  final String label;
  final List<String> options;

  DropdownSurveyField({
    required String name,
    required bool active,
    required this.label,
    required this.options,
  }) : super(
          active: active,
          type: "dropdown",
          name: name,
        );

  factory DropdownSurveyField.fromJson(Map<String, Object?> json) =>
      _$DropdownSurveyFieldFromJson(json);
  @override
  Map<String, Object?> toJson() => _$DropdownSurveyFieldToJson(this);

  @override
  Widget toWidget(String controlName) {
    return ReactiveDropdownField(
      formControlName: controlName,
      decoration: InputDecoration(
        label: Text(label),
        border: InputBorder.none,
      ),
      items: options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
    );
  }
}
