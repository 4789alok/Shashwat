import 'package:json_annotation/json_annotation.dart';
import "questionDetails.dart";
part 'questionData.g.dart';

@JsonSerializable()
class QuestionData {
  QuestionData();

  late num status;
  late String msg;
  late List<QuestionDetails> question;
  
  factory QuestionData.fromJson(Map<String,dynamic> json) => _$QuestionDataFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);
}
