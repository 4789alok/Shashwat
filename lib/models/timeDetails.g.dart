// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeDetails _$TimeDetailsFromJson(Map<String, dynamic> json) => TimeDetails()
  ..id = json['id'] as num?
  ..user_id = json['user_id'] as num?
  ..date = json['date'] as String?
  ..time = json['time'] as String?
  ..test_id = json['test_id'] as num?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$TimeDetailsToJson(TimeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'date': instance.date,
      'time': instance.time,
      'test_id': instance.test_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
