import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  final List<District> districts;

  Config({required this.districts});

  factory Config.fromJson(Map<String, Object?> json) => _$ConfigFromJson(json);
  Map<String, Object?> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class District {
  final String name;
  final List<Subdivision> subdivisions;

  District({
    required this.name,
    required this.subdivisions,
  });

  factory District.fromJson(Map<String, Object?> json) =>
      _$DistrictFromJson(json);
  Map<String, Object?> toJson() => _$DistrictToJson(this);
}

@JsonSerializable()
class Subdivision {
  final String name;
  final List<String> blocks;

  Subdivision({
    required this.name,
    required this.blocks,
  });

  factory Subdivision.fromJson(Map<String, Object?> json) =>
      _$SubdivisionFromJson(json);
  Map<String, Object?> toJson() => _$SubdivisionToJson(this);
}
