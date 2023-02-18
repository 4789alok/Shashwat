import 'package:json_annotation/json_annotation.dart';
import "standardDetails.dart";
part 'standardData.g.dart';

@JsonSerializable()
class StandardData {
  StandardData();

  late num status;
  late String msg;
  late List<StandardDetails> standard;
  
  factory StandardData.fromJson(Map<String,dynamic> json) => _$StandardDataFromJson(json);
  Map<String, dynamic> toJson() => _$StandardDataToJson(this);
}
