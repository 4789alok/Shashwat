// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediumData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediumData _$MediumDataFromJson(Map<String, dynamic> json) => MediumData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..medium = (json['medium'] as List<dynamic>)
      .map((e) => MediumDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$MediumDataToJson(MediumData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'medium': instance.medium,
    };
