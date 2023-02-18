// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestDetails _$TestDetailsFromJson(Map<String, dynamic> json) => TestDetails()
  ..id = json['id'] as num?
  ..medium_id = json['medium_id'] as num?
  ..standard_id = json['standard_id'] as num?
  ..subject_id = json['subject_id'] as num?
  ..chapter_id = json['chapter_id'] as num?
  ..name = json['name'] as String?
  ..notes = json['notes'] as String?
  ..date = json['date'] as String?
  ..time = json['time'] as String?
  ..duration = json['duration'] as String?
  ..total_marks = json['total_marks'] as num?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$TestDetailsToJson(TestDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medium_id': instance.medium_id,
      'standard_id': instance.standard_id,
      'subject_id': instance.subject_id,
      'chapter_id': instance.chapter_id,
      'name': instance.name,
      'notes': instance.notes,
      'date': instance.date,
      'time': instance.time,
      'duration': instance.duration,
      'total_marks': instance.total_marks,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
