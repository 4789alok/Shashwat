import 'package:json_annotation/json_annotation.dart';

part 'resultDetails.g.dart';

@JsonSerializable()
class ResultDetails {
  ResultDetails();

  late num? id;
  late String? test_id;
  late String? user_id;
  late String? total_marks;
  late String? correct_answer;
  late String? incorrect;
  late String? unaswered;
  late String? correct_total;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory ResultDetails.fromJson(Map<String, dynamic> json) =>
      _$ResultDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDetailsToJson(this);
}
