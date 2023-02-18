// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapterData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterData _$ChapterDataFromJson(Map<String, dynamic> json) => ChapterData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..chapter = (json['chapter'] as List<dynamic>)
      .map((e) => ChapterDetails.fromJson(e as Map<String, dynamic>))
      .toList()
  ..slider = json['slider'] == null
      ? null
      : (json['slider'] as List<dynamic>)
          .map((e) => BannerDetails.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ChapterDataToJson(ChapterData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'chapter': instance.chapter,
      'slider': instance.slider,
    };
