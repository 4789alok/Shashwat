import 'package:json_annotation/json_annotation.dart';

part 'testDetails.g.dart';

@JsonSerializable()
class TestDetails {
  TestDetails();

  late num? id;
  late num? medium_id;
  late num? standard_id;
  late num? subject_id;
  late num? chapter_id;
  late String? name;
  late String? notes;
  late String? date;
  late String? time;
  late String? duration;
  late num? total_marks;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory TestDetails.fromJson(Map<String, dynamic> json) =>
      _$TestDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TestDetailsToJson(this);
}
