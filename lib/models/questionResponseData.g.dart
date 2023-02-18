// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseData _$QuestionResponseDataFromJson(
        Map<String, dynamic> json) =>
    QuestionResponseData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..question = (json['question'] as List<dynamic>)
          .map((e) =>
              QuestionResponseDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$QuestionResponseDataToJson(
        QuestionResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'question': instance.question,
    };
