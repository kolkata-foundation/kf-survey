import 'package:json_annotation/json_annotation.dart';

part 'family.g.dart';

@JsonSerializable()
class Family {
  final String last_name;
  final String phone;
  final String district;
  final String subdivision;
  final String block;
  final List<Member> members;
  final List<String> modified_by;
  final int modified_on;

  Family({
    required this.last_name,
    required this.phone,
    required this.district,
    required this.subdivision,
    required this.block,
    required this.members,
    required this.modified_by,
    required this.modified_on,
  });

  factory Family.fromJson(Map<String, Object?> json) => _$FamilyFromJson(json);
  Map<String, Object?> toJson() => _$FamilyToJson(this);
}

@JsonSerializable()
class Member {
  final String name;
  final int age;
  final String phone;
  final String member_id;
  final String gender;

  Member({
    required this.name,
    required this.age,
    required this.phone,
    required this.gender,
    required this.member_id,
  });

  factory Member.fromJson(Map<String, Object?> json) => _$MemberFromJson(json);
  Map<String, Object?> toJson() => _$MemberToJson(this);
}
