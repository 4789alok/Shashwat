// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapterDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterDetails _$ChapterDetailsFromJson(Map<String, dynamic> json) =>
    ChapterDetails()
      ..id = json['id'] as num?
      ..medium_id = json['medium_id'] as num?
      ..standard_id = json['standard_id'] as num?
      ..subject_id = json['subject_id'] as num?
      ..name = json['name'] as String?
      ..notes = json['notes'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$ChapterDetailsToJson(ChapterDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medium_id': instance.medium_id,
      'standard_id': instance.standard_id,
      'subject_id': instance.subject_id,
      'name': instance.name,
      'notes': instance.notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
