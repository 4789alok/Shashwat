import 'package:json_annotation/json_annotation.dart';

part 'timeDetails.g.dart';

@JsonSerializable()
class TimeDetails {
  TimeDetails();

  late num? id;
  late num? user_id;
  late String? date;
  late String? time;
  late num? test_id;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory TimeDetails.fromJson(Map<String, dynamic> json) =>
      _$TimeDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TimeDetailsToJson(this);
}
