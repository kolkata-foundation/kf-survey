// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      districts: (json['districts'] as List<dynamic>)
          .map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'districts': instance.districts,
    };

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      name: json['name'] as String,
      subdivisions: (json['subdivisions'] as List<dynamic>)
          .map((e) => Subdivision.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'name': instance.name,
      'subdivisions': instance.subdivisions,
    };

Subdivision _$SubdivisionFromJson(Map<String, dynamic> json) => Subdivision(
      name: json['name'] as String,
      blocks:
          (json['blocks'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubdivisionToJson(Subdivision instance) =>
    <String, dynamic>{
      'name': instance.name,
      'blocks': instance.blocks,
    };
