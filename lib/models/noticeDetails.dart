import 'package:json_annotation/json_annotation.dart';

part 'noticeDetails.g.dart';

@JsonSerializable()
class NoticeDetails {
  NoticeDetails();

  late num? id;
  late String? notes;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory NoticeDetails.fromJson(Map<String, dynamic> json) =>
      _$NoticeDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeDetailsToJson(this);
}
