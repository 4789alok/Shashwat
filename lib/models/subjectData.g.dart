// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjectData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectData _$SubjectDataFromJson(Map<String, dynamic> json) => SubjectData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..subject = (json['subject'] as List<dynamic>)
      .map((e) => SubjectDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SubjectDataToJson(SubjectData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'subject': instance.subject,
    };
