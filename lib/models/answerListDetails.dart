import 'package:json_annotation/json_annotation.dart';

part 'answerListDetails.g.dart';

@JsonSerializable()
class AnswerListDetails {
  AnswerListDetails();

  late num? id;
  late num? medium_id;
  late num? standard_id;
  late num? subject_id;
  late num? chapter_id;
  late num? test_id;
  late String? type;
  late String? option5;
  late String? option6;
  late String? question;
  late String? question_image;
  late String? option1;
  late String? option2;
  late String? option3;
  late String? option4;
  late String? option_image1;
  late String? option_image2;
  late String? option_image3;
  late String? option_image4;
  late String? answer;
  late String? marks;
  late String? created_at;
  late String? updated_at;
  late String? deleted_at;
  late String? user_answer;

  factory AnswerListDetails.fromJson(Map<String, dynamic> json) =>
      _$AnswerListDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerListDetailsToJson(this);
}
