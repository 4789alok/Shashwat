// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediumDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediumDetails _$MediumDetailsFromJson(Map<String, dynamic> json) =>
    MediumDetails()
      ..id = json['id'] as num?
      ..name = json['name'] as String?
      ..notes = json['notes'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$MediumDetailsToJson(MediumDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'notes': instance.notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
