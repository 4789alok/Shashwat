import 'package:json_annotation/json_annotation.dart';
import "resultDetails.dart";
part 'resultData.g.dart';

@JsonSerializable()
class ResultData {
  ResultData();

  late num status;
  late String msg;
  late ResultDetails result;
  
  factory ResultData.fromJson(Map<String,dynamic> json) => _$ResultDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}
