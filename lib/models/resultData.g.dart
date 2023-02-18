// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultData _$ResultDataFromJson(Map<String, dynamic> json) => ResultData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..result = ResultDetails.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result,
    };
