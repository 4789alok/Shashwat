import 'package:json_annotation/json_annotation.dart';

part 'userDetails.g.dart';

@JsonSerializable()
class UserDetails {
  UserDetails();

  late num? id;
  late String? name;
  late String? email;
  late String? email_verified_at;
  late String? mobile;
  late String? user_type;
  late String? image;
  late num? status;
  late String? dob;
  late String? standard;
  late String? school_name;
  late String? recent_percentage;
  late String? hobbies;
  late String? address;
  late String? pin_code;
  late num? active;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
