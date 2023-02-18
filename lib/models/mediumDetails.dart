import 'package:json_annotation/json_annotation.dart';

part 'mediumDetails.g.dart';

@JsonSerializable()
class MediumDetails {
  MediumDetails();

  late num? id;
  late String? name;
  late String? notes;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory MediumDetails.fromJson(Map<String, dynamic> json) =>
      _$MediumDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MediumDetailsToJson(this);
}
