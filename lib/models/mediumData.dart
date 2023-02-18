import 'package:json_annotation/json_annotation.dart';
import "mediumDetails.dart";
part 'mediumData.g.dart';

@JsonSerializable()
class MediumData {
  MediumData();

  late num status;
  late String msg;
  late List<MediumDetails> medium;
  
  factory MediumData.fromJson(Map<String,dynamic> json) => _$MediumDataFromJson(json);
  Map<String, dynamic> toJson() => _$MediumDataToJson(this);
}
