// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionResponseDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseDetails _$QuestionResponseDetailsFromJson(
        Map<String, dynamic> json) =>
    QuestionResponseDetails()
      ..id = json['id'] as num?
      ..question_id = json['question_id'] as num?
      ..question = json['question'] as String?
      ..answer = json['answer'] as String?
      ..user_id = json['user_id'] as num?
      ..test_id = json['test_id'] as num?
      ..date = json['date'] as String?
      ..time = json['time'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$QuestionResponseDetailsToJson(
        QuestionResponseDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.question_id,
      'question': instance.question,
      'answer': instance.answer,
      'user_id': instance.user_id,
      'test_id': instance.test_id,
      'date': instance.date,
      'time': instance.time,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
