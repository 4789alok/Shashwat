// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noticeDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeDetails _$NoticeDetailsFromJson(Map<String, dynamic> json) =>
    NoticeDetails()
      ..id = json['id'] as num?
      ..notes = json['notes'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$NoticeDetailsToJson(NoticeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notes': instance.notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
