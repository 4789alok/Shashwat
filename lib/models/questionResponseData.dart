import 'package:json_annotation/json_annotation.dart';
import "questionResponseDetails.dart";
part 'questionResponseData.g.dart';

@JsonSerializable()
class QuestionResponseData {
  QuestionResponseData();

  late num status;
  late String msg;
  late List<QuestionResponseDetails> question;
  
  factory QuestionResponseData.fromJson(Map<String,dynamic> json) => _$QuestionResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionResponseDataToJson(this);
}
