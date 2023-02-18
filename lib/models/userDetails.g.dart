// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails()
  ..id = json['id'] as num?
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..email_verified_at = json['email_verified_at'] as String?
  ..mobile = json['mobile'] as String?
  ..user_type = json['user_type'] as String?
  ..image = json['image'] as String?
  ..status = json['status'] as num?
  ..dob = json['dob'] as String?
  ..standard = json['standard'] as String?
  ..school_name = json['school_name'] as String?
  ..recent_percentage = json['recent_percentage'] as String?
  ..hobbies = json['hobbies'] as String?
  ..address = json['address'] as String?
  ..pin_code = json['pin_code'] as String?
  ..active = json['active'] as num?
  ..created_at = json['created_at'] as String?
  ..updated_at = json['updated_at'] as String?
  ..deleted_at = json['deleted_at'] as String?;

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'mobile': instance.mobile,
      'user_type': instance.user_type,
      'image': instance.image,
      'status': instance.status,
      'dob': instance.dob,
      'standard': instance.standard,
      'school_name': instance.school_name,
      'recent_percentage': instance.recent_percentage,
      'hobbies': instance.hobbies,
      'address': instance.address,
      'pin_code': instance.pin_code,
      'active': instance.active,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
