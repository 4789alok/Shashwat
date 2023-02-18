import 'package:json_annotation/json_annotation.dart';

part 'questionResponseDetails.g.dart';

@JsonSerializable()
class QuestionResponseDetails {
  QuestionResponseDetails();

  late num? id;
  late num? question_id;
  late String? question;
  late String? answer;
  late num? user_id;
  late num? test_id;
  late String? date;
  late String? time;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;

  factory QuestionResponseDetails.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionResponseDetailsToJson(this);
}
