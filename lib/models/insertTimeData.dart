import 'package:json_annotation/json_annotation.dart';
import "timeDetails.dart";
part 'insertTimeData.g.dart';

@JsonSerializable()
class InsertTimeData {
  InsertTimeData();

  late num status;
  late String msg;
  late TimeDetails datetime;
  
  factory InsertTimeData.fromJson(Map<String,dynamic> json) => _$InsertTimeDataFromJson(json);
  Map<String, dynamic> toJson() => _$InsertTimeDataToJson(this);
}
