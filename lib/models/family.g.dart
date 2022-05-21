// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      last_name: json['last_name'] as String,
      phone: json['phone'] as String,
      locality: json['locality'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      modified_by: (json['modified_by'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      modified_on: json['modified_on'] as int,
    );

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'last_name': instance.last_name,
      'phone': instance.phone,
      'locality': instance.locality,
      'members': instance.members,
      'modified_by': instance.modified_by,
      'modified_on': instance.modified_on,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      name: json['name'] as String,
      age: json['age'] as int,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'phone': instance.phone,
    };
