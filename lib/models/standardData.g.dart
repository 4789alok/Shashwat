// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standardData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardData _$StandardDataFromJson(Map<String, dynamic> json) => StandardData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..standard = (json['standard'] as List<dynamic>)
      .map((e) => StandardDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$StandardDataToJson(StandardData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'standard': instance.standard,
    };
