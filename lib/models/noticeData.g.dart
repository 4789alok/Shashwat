// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeData _$NoticeDataFromJson(Map<String, dynamic> json) => NoticeData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..news = (json['news'] as List<dynamic>)
      .map((e) => NoticeDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$NoticeDataToJson(NoticeData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'news': instance.news,
    };
