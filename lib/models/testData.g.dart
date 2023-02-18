// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestData _$TestDataFromJson(Map<String, dynamic> json) => TestData()
  ..status = json['status'] as num
  ..msg = json['msg'] as String
  ..test = (json['test'] as List<dynamic>)
      .map((e) => TestDetails.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TestDataToJson(TestData instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'test': instance.test,
    };
