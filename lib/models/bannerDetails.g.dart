// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannerDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerDetails _$BannerDetailsFromJson(Map<String, dynamic> json) =>
    BannerDetails()
      ..id = json['id'] as num?
      ..image = json['image'] as String?
      ..type = json['type'] as String?
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?
      ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$BannerDetailsToJson(BannerDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'type': instance.type,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
