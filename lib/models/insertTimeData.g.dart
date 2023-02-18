// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insertTimeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertTimeData _$InsertTimeDataFromJson(Map<String, dynamic> json) =>
    InsertTimeData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..datetime =
          TimeDetails.fromJson(json['datetime'] as Map<String, dynamic>);

Map<String, dynamic> _$InsertTimeDataToJson(InsertTimeData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'datetime': instance.datetime,
    };
