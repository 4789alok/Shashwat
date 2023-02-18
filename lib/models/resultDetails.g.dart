// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDetails _$ResultDetailsFromJson(Map<String, dynamic> json) =>
    ResultDetails()
      ..id = json['id'] as num?
      ..test_id = json['test_id'] as String?
      ..user_id = json['user_id'] as String?
      ..total_marks = json['total_marks'] as String?
      ..correct_answer = json['correct_answer'] as String?
      ..incorrect = json['incorrect'] as String?
      ..unaswered = json['unaswered'] as String?
      ..correct_total = json['correct_total'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$ResultDetailsToJson(ResultDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'test_id': instance.test_id,
      'user_id': instance.user_id,
      'total_marks': instance.total_marks,
      'correct_answer': instance.correct_answer,
      'incorrect': instance.incorrect,
      'unaswered': instance.unaswered,
      'correct_total': instance.correct_total,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
