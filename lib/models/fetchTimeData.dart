import 'package:json_annotation/json_annotation.dart';
import "timeDetails.dart";
part 'fetchTimeData.g.dart';

@JsonSerializable()
class FetchTimeData {
  FetchTimeData();

  late num status;
  late String msg;
  late List<TimeDetails> datetime;
  
  factory FetchTimeData.fromJson(Map<String,dynamic> json) => _$FetchTimeDataFromJson(json);
  Map<String, dynamic> toJson() => _$FetchTimeDataToJson(this);
}
