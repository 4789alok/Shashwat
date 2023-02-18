import 'package:json_annotation/json_annotation.dart';
import "bannerDetails.dart";
part 'bannerData.g.dart';

@JsonSerializable()
class BannerData {
  BannerData();

  late num status;
  late String msg;
  late List<BannerDetails> slider;
  
  factory BannerData.fromJson(Map<String,dynamic> json) => _$BannerDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}
