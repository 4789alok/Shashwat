import 'package:json_annotation/json_annotation.dart';
import "answerListDetails.dart";
part 'answerListData.g.dart';

@JsonSerializable()
class AnswerListData {
  AnswerListData();

  late num status;
  late String msg;
  late List<AnswerListDetails> question;
  
  factory AnswerListData.fromJson(Map<String,dynamic> json) => _$AnswerListDataFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerListDataToJson(this);
}
