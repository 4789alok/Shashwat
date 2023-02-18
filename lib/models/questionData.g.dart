// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) => QuestionData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..question = (json['question'] as List<dynamic>)
      .map((e) => QuestionDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$QuestionDataToJson(QuestionData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'question': instance.question,
    };
