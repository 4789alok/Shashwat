// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answerListData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerListData _$AnswerListDataFromJson(Map<String, dynamic> json) =>
    AnswerListData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..question = (json['question'] as List<dynamic>)
          .map((e) => AnswerListDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AnswerListDataToJson(AnswerListData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'question': instance.question,
    };
