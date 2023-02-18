import 'package:json_annotation/json_annotation.dart';

part 'bannerDetails.g.dart';

@JsonSerializable()
class BannerDetails {
  BannerDetails();

  late num? id;
  late String? image;
  late String? type;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory BannerDetails.fromJson(Map<String, dynamic> json) =>
      _$BannerDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDetailsToJson(this);
}
