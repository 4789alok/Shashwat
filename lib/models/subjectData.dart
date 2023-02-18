import 'package:json_annotation/json_annotation.dart';
import "subjectDetails.dart";
part 'subjectData.g.dart';

@JsonSerializable()
class SubjectData {
  SubjectData();

  late num status;
  late String msg;
  late List<SubjectDetails> subject;
  
  factory SubjectData.fromJson(Map<String,dynamic> json) => _$SubjectDataFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectDataToJson(this);
}
