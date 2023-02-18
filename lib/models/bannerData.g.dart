// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannerData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..slider = (json['slider'] as List<dynamic>)
      .map((e) => BannerDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'slider': instance.slider,
    };
