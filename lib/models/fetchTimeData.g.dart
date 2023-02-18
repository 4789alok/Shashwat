// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchTimeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchTimeData _$FetchTimeDataFromJson(Map<String, dynamic> json) =>
    FetchTimeData()
      ..status = json['status'] as num
      ..msg = json['msg'] as String
      ..datetime = (json['datetime'] as List<dynamic>)
          .map((e) => TimeDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$FetchTimeDataToJson(FetchTimeData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'datetime': instance.datetime,
    };
